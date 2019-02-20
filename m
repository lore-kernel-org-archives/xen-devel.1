From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RESEND PATCH 0/7] Add FOLL_LONGTERM to GUP fast
 and use it
Date: Wed, 20 Feb 2019 07:19:30 -0800
Message-ID: <20190220151930.GB11695__42347.600071092$1550676140$gmane$org@infradead.org>
References: <20190220053040.10831-1-ira.weiny@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9uSJ=Q3=bombadil.srs.infradead.org=batv+a6035ce01c0cd448ed71+5659+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1gwTgR-0003pn-75
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 15:21:15 +0000
Content-Disposition: inline
In-Reply-To: <20190220053040.10831-1-ira.weiny@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: ira.weiny@intel.com
Cc: linux-fbdev@vger.kernel.org, Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>, linux-fpga@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, xen-devel@lists.xenproject.org, devel@lists.orangefs.org, linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, kvm-ppc@vger.kernel.org, Borislav
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDk6MzA6MzNQTSAtMDgwMCwgaXJhLndlaW55QGludGVs
LmNvbSB3cm90ZToKPiBGcm9tOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gCj4g
UmVzZW5kaW5nIHRoZXNlIGFzIEkgaGFkIG9ubHkgMSBtaW5vciBjb21tZW50IHdoaWNoIEkgYmVs
aWV2ZSB3ZSBoYXZlIGNvdmVyZWQKPiBpbiB0aGlzIHNlcmllcy4gIEkgd2FzIGFudGljaXBhdGlu
ZyB0aGVzZSBnb2luZyB0aHJvdWdoIHRoZSBtbSB0cmVlIGFzIHRoZXkKPiBkZXBlbmQgb24gYSBj
bGVhbnVwIHBhdGNoIHRoZXJlIGFuZCB0aGUgSUIgY2hhbmdlcyBhcmUgdmVyeSBtaW5vci4gIEJ1
dCB0aGV5Cj4gY291bGQganVzdCBhcyB3ZWxsIGdvIHRocm91Z2ggdGhlIElCIHRyZWUuCj4gCj4g
Tk9URTogVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiBteSBjbGVhbiB1cCBwYXRjaCB0byByZW1vdmUg
dGhlIHdyaXRlIHBhcmFtZXRlcgo+IGZyb20gZ3VwX2Zhc3RfcGVybWl0dGVkKClbMV0KPiAKPiBI
RkkxLCBxaWIsIGFuZCBtdGhjYSwgdXNlIGdldF91c2VyX3BhZ2VzX2Zhc3QoKSBkdWUgdG8gaXQg
cGVyZm9ybWFuY2UKPiBhZHZhbnRhZ2VzLiAgVGhlc2UgcGFnZXMgY2FuIGJlIGhlbGQgZm9yIGEg
c2lnbmlmaWNhbnQgdGltZS4gIEJ1dAo+IGdldF91c2VyX3BhZ2VzX2Zhc3QoKSBkb2VzIG5vdCBw
cm90ZWN0IGFnYWluc3QgbWFwcGluZyBvZiBGUyBEQVggcGFnZXMuCgpUaGlzIEkgZG9uJ3QgZ2V0
IC0gaWYgeW91IGRvIGxvY2sgZG93biBsb25nIHRlcm0gbWFwcGluZ3MgcGVyZm9ybWFuY2UKb2Yg
dGhlIGFjdHVhbCBnZXRfdXNlcl9wYWdlcyBjYWxsIHNob3VsZG4ndCBtYXR0ZXIgdG8gc3RhcnQg
d2l0aC4KCldoYXQgZG8gSSBtaXNzPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
