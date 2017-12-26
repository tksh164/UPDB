using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UpdateProgramDB.Models
{
    public class ProcessTarget
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [StringLength(4000)]
        public string FilePath { get; set; }

        [Required]
        [StringLength(400)]
        public string AdditionalData { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public bool IsProcessStarted { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public bool IsProcessCompleted { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime InsertedTimestampUtc { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        [Column(TypeName = "datetime2")]
        public DateTime ProcessStartedTimestampUtc { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        [Column(TypeName = "datetime2")]
        public DateTime ProcessCompletedTimestampUtc { get; set; }
    }
}
