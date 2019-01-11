# Generated by Django 2.1.4 on 2019-01-11 16:43

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('mainapp', '0007_auto_20190108_0757'),
    ]

    operations = [
        migrations.AlterField(
            model_name='book',
            name='abstract',
            field=models.TextField(blank=True, verbose_name='Περίληψη'),
        ),
        migrations.AlterField(
            model_name='book',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='Δημιουργία'),
        ),
        migrations.AlterField(
            model_name='book',
            name='dimensions',
            field=models.CharField(blank=True, max_length=50, verbose_name='Διαστάσεις'),
        ),
        migrations.AlterField(
            model_name='book',
            name='image',
            field=models.ImageField(default='default_book.png', upload_to='book_covers', verbose_name='Εξώφυλλο'),
        ),
        migrations.AlterField(
            model_name='book',
            name='isbn',
            field=models.CharField(blank=True, max_length=50, verbose_name='ISBN'),
        ),
        migrations.AlterField(
            model_name='book',
            name='language',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='books', to='mainapp.Language', verbose_name='Γλώσσα'),
        ),
        migrations.AlterField(
            model_name='book',
            name='pages',
            field=models.PositiveSmallIntegerField(default=0, verbose_name='Αριθμός σελίδων'),
        ),
        migrations.AlterField(
            model_name='book',
            name='published_month',
            field=models.PositiveSmallIntegerField(blank=True, null=True, verbose_name='Μήνας έκδοσης'),
        ),
        migrations.AlterField(
            model_name='book',
            name='published_year',
            field=models.PositiveSmallIntegerField(blank=True, null=True, verbose_name='Έτος έκδοσης'),
        ),
        migrations.AlterField(
            model_name='book',
            name='publisher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='books', to='mainapp.Publisher', verbose_name='Εκδότης'),
        ),
        migrations.AlterField(
            model_name='book',
            name='revision',
            field=models.PositiveSmallIntegerField(default=1, verbose_name='Αριθμός έκδοσης'),
        ),
        migrations.AlterField(
            model_name='book',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Τίτλος βιβλίου'),
        ),
        migrations.AlterField(
            model_name='book',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, null=True, verbose_name='Τροποποίηση'),
        ),
        migrations.AlterField(
            model_name='book',
            name='weight',
            field=models.PositiveIntegerField(blank=True, null=True, verbose_name='Βάρος (γραμμάρια)'),
        ),
        migrations.AlterField(
            model_name='entry',
            name='cancel_date',
            field=models.DateTimeField(blank=True, null=True, verbose_name='Ημερομηνία ακύρωσης'),
        ),
        migrations.AlterField(
            model_name='entry',
            name='classification',
            field=models.CharField(blank=True, max_length=255, verbose_name='Πληροφορίες ταξινόμησης'),
        ),
        migrations.AlterField(
            model_name='entry',
            name='entry_date',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='Ημερομηνία εισαγωγής'),
        ),
        migrations.AlterField(
            model_name='entry',
            name='notes',
            field=models.TextField(blank=True, verbose_name='Σημειώσεις'),
        ),
        migrations.AlterField(
            model_name='hold',
            name='created_at',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]