From: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V2 3/7] mm/gup: Change GUP fast to use flags
 rather than a write 'bool'
Date: Wed, 13 Feb 2019 15:52:01 -0800
Message-ID: <20190213235200.GA1151__31214.5647754491$1550123326$gmane$org@iweiny-DESK2.sc.intel.com>
References: <20190211201643.7599-1-ira.weiny@intel.com>
 <20190213230455.5605-1-ira.weiny@intel.com>
 <20190213230455.5605-4-ira.weiny@intel.com>
 <20190213231110.GD24692@ziepe.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U1ZV=QU=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1gu4KA-0001PS-TE
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 23:52:18 +0000
Content-Disposition: inline
In-Reply-To: <20190213231110.GD24692@ziepe.ca>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Martin Brandenburg <martin@omnibond.com>, linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>, kvm@vger.kernel.org, linux-sh@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, David Hildenbrand <david@redhat.com>, Rob Springer <rspringer@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Matt Porter <mporter@kernel.crashing.org>, Jason Wang <jasowang@redhat.com>, devel@lists.orangefs.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMTMsIDIwMTkgYXQgMDQ6MTE6MTBQTSAtMDcwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgRmViIDEzLCAyMDE5IGF0IDAzOjA0OjUxUE0gLTA4MDAsIGlyYS53
ZWlueUBpbnRlbC5jb20gd3JvdGU6Cj4gPiBGcm9tOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRl
bC5jb20+Cj4gPiAKPiA+IFRvIGZhY2lsaXRhdGUgYWRkaXRpb25hbCBvcHRpb25zIHRvIGdldF91
c2VyX3BhZ2VzX2Zhc3QoKSBjaGFuZ2UgdGhlCj4gPiBzaW5ndWxhciB3cml0ZSBwYXJhbWV0ZXIg
dG8gYmUgZ3VwX2ZsYWdzLgo+IAo+IFNvIG5vdyB3ZSBoYXZlOgo+IAo+IGxvbmcgZ2V0X3VzZXJf
cGFnZXNfdW5sb2NrZWQodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBucl9wYWdl
cywKPiAJCSAgICBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1bnNpZ25lZCBpbnQgZ3VwX2ZsYWdzKTsK
PiAKPiBhbmQgCj4gCj4gaW50IGdldF91c2VyX3BhZ2VzX2Zhc3QodW5zaWduZWQgbG9uZyBzdGFy
dCwgaW50IG5yX3BhZ2VzLAo+IAkJCXVuc2lnbmVkIGludCBndXBfZmxhZ3MsIHN0cnVjdCBwYWdl
ICoqcGFnZXMpCj4gCj4gRG9lcyB0aGlzIG1ha2UgYW55IHNlbnNlPyBBdCBsZWFzdCB0aGUgYXJn
dW1lbnRzIHNob3VsZCBiZSBpbiB0aGUgc2FtZQo+IG9yZGVyLCBJIHRoaW5rLgoKWWVzLi4uICBh
bmQgbm8uICBzZWUgYmVsb3cuCgo+IAo+IEFsc28gdGhpcyBjb21tZW50Ogo+IC8qCj4gICogZ2V0
X3VzZXJfcGFnZXNfdW5sb2NrZWQoKSBpcyBzdWl0YWJsZSB0byByZXBsYWNlIHRoZSBmb3JtOgo+
ICAqCj4gICogICAgICBkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gICogICAgICBnZXRfdXNl
cl9wYWdlcyh0c2ssIG1tLCAuLi4sIHBhZ2VzLCBOVUxMKTsKPiAgKiAgICAgIHVwX3JlYWQoJm1t
LT5tbWFwX3NlbSk7Cj4gICoKPiAgKiAgd2l0aDoKPiAgKgo+ICAqICAgICAgZ2V0X3VzZXJfcGFn
ZXNfdW5sb2NrZWQodHNrLCBtbSwgLi4uLCBwYWdlcyk7Cj4gICoKPiAgKiBJdCBpcyBmdW5jdGlv
bmFsbHkgZXF1aXZhbGVudCB0byBnZXRfdXNlcl9wYWdlc19mYXN0IHNvCj4gICogZ2V0X3VzZXJf
cGFnZXNfZmFzdCBzaG91bGQgYmUgdXNlZCBpbnN0ZWFkIGlmIHNwZWNpZmljIGd1cF9mbGFncwo+
ICAqIChlLmcuIEZPTExfRk9SQ0UpIGFyZSBub3QgcmVxdWlyZWQuCj4gICovCj4gCj4gTmVlZHMg
c29tZSBhdHRlbnRpb24gYXMgdGhlIHJlY29tbWVuZGF0aW9uIGlzIG5vdyBub25zZW5zZS4KCklN
TyB0aGV5IGFyZSBub3QgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQuCgpXZSBjYW4ndCByZW1vdmUg
Kl91bmxvY2tlZCgpIGFzIGl0IGlzIHVzZWQgYXMgYm90aCBhIGhlbHBlciBmb3IgdGhlIGFyY2gK
c3BlY2lmaWMgKl9mYXN0KCkgY2FsbHMsIF9hbmRfIGluIGRyaXZlcnMuICBBZ2FpbiBJIGRvbid0
IGtub3cgdGhlIGhpc3RvcnkgaGVyZQpidXQgaXQgY291bGQgYmUgdGhhdCB0aGUgZHJpdmVycyBz
aG91bGQgbmV2ZXIgaGF2ZSB1c2VkIHRoZSBjYWxsIGluIHRoZSBmaXJzdApwbGFjZT8/PyAgT3Ig
YmVlbiBjb252ZXJ0ZWQgYXQgc29tZSBwb2ludD8KCkkgY291bGQgY2hhbmdlIHRoZSBjb21tZW50
IHRvIGJlIHNvbWV0aGluZyBsaWtlCgovKgogKiBnZXRfdXNlcl9wYWdlc191bmxvY2tlZCgpIGlz
IG9ubHkgdG8gYmUgdXNlZCBieSBhcmNoIHNwZWNpZmljCiAqIGdldF91c2VyX3BhZ2VzX2Zhc3Qo
KSBjYWxscy4gIERyaXZlcnMgc2hvdWxkIGJlIGNhbGxpbmcKICogZ2V0X3VzZXJfcGFnZXNfZmFz
dCgpCiAqLwoKSW5zdGVhZCBvZiB0aGUgY3VycmVudCBjb21tZW50LgoKQW5kIGNoYW5nZSB0aGUg
ZHJpdmVycyB0byBnZXRfdXNlcl9wYWdlc19mYXN0KCkuCgpIb3dldmVyLCBJJ20gbm90IHN1cmUg
aWYgdGhlc2UgZHJpdmVycyBuZWVkIHRoZSBGT0xMX1RPVUNIIGZsYWcgd2hpY2gKKl91bmxvY2tl
ZCgpIGFkZHMgZm9yIHRoZW0uICBBbmQgYWRkaW5nIEZPTExfVE9VQ0ggdG8gKl9mYXN0KCkgaXMg
bm90IGdvaW5nIHRvCmdpdmUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eS4KCkl0IF9sb29rc18gbGlr
ZSB3ZSBjYW4gYWRkIEZPTExfVE9VQ0ggZnVuY3Rpb25hbGl0eSB0byB0aGUgZmFzdCBwYXRoIGlu
IHRoZQpnZW5lcmljIGNvZGUuICBJJ20gbm90IHN1cmUgYWJvdXQgdGhlIGFyY2gncy4KCklmIHdl
IGRpZCB0aGF0IHRoZW4gd2UgY2FuIGhhdmUgdGhvc2UgZHJpdmVycyB1c2UgRk9MTF9UT1VDSCBv
ciBub3QgaW4gKl9mYXN0KCkKaWYgdGhleSB3YW50L25lZWQuCgo+IAo+IEhvbmVzdGx5IGEgcHJv
cGVyIGV4cGxhbmF0aW9uIG9mIHdoeSB0d28gZnVuY3Rpb25zIGV4aXN0IHdvdWxkIGJlCj4gZ3Jl
YXQgYXQgdGhpcyBwb2ludCA6KQoKSSd2ZSBub3QgcmVzZWFyY2hlZCBpdC4gIEkgZG8gYWdyZWUg
dGhhdCB0aGVyZSBzZWVtcyB0byBiZSBhIGxvdCBvZiBjYWxscyBpbgp0aGlzIGZpbGUgYW5kIHRo
ZSBkaWZmZXJlbmNlcyBhcmUgc3VidGxlLgoKSXJhCgo+IAo+IEphc29uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
