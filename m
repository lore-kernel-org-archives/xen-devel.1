From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
Date: Tue, 23 Apr 2019 10:20:10 -0400
Message-ID: <e49eed35-6cf5-77d9-ba59-e1e021cece83__35579.5280936704$1556028908$gmane$org@oracle.com>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMkX=SZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hIwBD-00085R-Ti
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 14:13:51 +0000
In-Reply-To: <20190423105457.17502-2-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Cc: sstabellini@kernel.org, stable@vger.kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8xOSA2OjU0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IFRoZSBjb25kaXRpb24g
aW4geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpIGZvciBkZWNpZGluZyB3aGV0aGVyIHRvCj4g
Y2FsbCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzIHdyb25nOiBpbiBjYXNlIHRo
ZSByZWdpb24gdG8KPiBiZSBmcmVlZCBpcyBub3QgY29udGlndW91cyBjYWxsaW5nIHhlbl9kZXN0
cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaXMKPiB0aGUgd3JvbmcgdGhpbmcgdG8gZG86IGl0IHdv
dWxkIHJlc3VsdCBpbiBpbmNvbnNpc3RlbnQgbWFwcGluZ3Mgb2YKPiBtdWx0aXBsZSBQRk5zIHRv
IHRoZSBzYW1lIE1GTi4gVGhpcyB3aWxsIGxlYWQgdG8gdmFyaW91cyBzdHJhbmdlCj4gY3Jhc2hl
cyBvciBkYXRhIGNvcnJ1cHRpb24uCj4KPiBJbnN0ZWFkIG9mIGNhbGxpbmcgeGVuX2Rlc3Ryb3lf
Y29udGlndW91c19yZWdpb24oKSBpbiB0aGF0IGNhc2UgYQo+IHdhcm5pbmcgc2hvdWxkIGJlIGlz
c3VlZCBhcyB0aGF0IHNpdHVhdGlvbiBzaG91bGQgbmV2ZXIgb2NjdXIuCj4KPiBDYzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBv
cmFjbGUuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
