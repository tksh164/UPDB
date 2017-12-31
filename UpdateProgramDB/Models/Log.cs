using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace UpdateProgramDB.Models
{
    public class Log
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [Column(TypeName = "datetime2")]
        public DateTime TimestampUtc { get; set; }

        [Required]
        [StringLength(20)]
        public string Source { get; set; }

        [Required]
        public short ClassificationId { get; set; }

        [Required]
        [StringLength(400)]
        public string Message { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        [StringLength(4000)]
        public string Data { get; set; }

        public int? ProcessTargetId { get; set; }
    }
}
