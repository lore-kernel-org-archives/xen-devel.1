From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2] xen/blkfront: avoid NULL blkfront_info
 dereference on device removal
Date: Thu, 18 Oct 2018 19:54:17 -0400
Message-ID: <20181018235417.GB36047__35437.7200048932$1539906793$gmane$org@konrads-mbp.lan>
References: <20181015132508.23293-1-vliaskovitis@suse.com>
 <20181015140201.elir7ettk7sz4aix@mac.bytemobile.com>
 <b0b793a6cdfd634e126fbb00554ca68a780a00bd.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cvio=m6=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1gDI7e-0007TZ-2n
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 23:54:34 +0000
Content-Disposition: inline
In-Reply-To: <b0b793a6cdfd634e126fbb00554ca68a780a00bd.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vasilis Liaskovitis <vliaskovitis@suse.com>
Cc: jgross@suse.com, axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMDQ6MjU6NTZQTSArMDIwMCwgVmFzaWxpcyBMaWFza292
aXRpcyB3cm90ZToKPiBPbiBNb24sIDIwMTgtMTAtMTUgYXQgMTY6MDIgKzAyMDAsIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6Cj4gPiAKPiA+ID4gVGhpcyByZXN1bHRzIGluIGEgTlVMTCBwb2ludGVy
IEJVRyB3aGVuIGJsa2Zyb250X3JlbW92ZSBhbmQKPiA+ID4gYmxraWZfZnJlZQo+ID4gPiB0cnkg
dG8gYWNjZXNzIHRoZSBmYWlsaW5nIGRldmljZSdzIE5VTEwgc3RydWN0IGJsa2Zyb250X2luZm8u
Cj4gPiA+IAo+ID4gPiAKPiA+IEkgZ3Vlc3MgdGhpcyBpcyBhIGNhbmRpZGF0ZSBmb3IgYmFja3Bv
cnRpbmc/Cj4gPiAKPiAKPiB5ZXMsIEkgdGhpbmsgc28uIEF0IGxlYXN0IGZvciBrZXJuZWxzID49
NC41LCB3aGljaCBjb3VsZCBmYWNlIHRoaXMKPiBpc3N1ZSBkdWUgdG8gY29tbWl0IGMzMWVjZjZj
MTIgKHRoaXMgZnJlZXMgdGhlIHN0cnVjdCBibGtpbmZvIGluIHRoZQo+IGZhaWxpbmcgcGF0aCBv
ZiB0YWxrX3RvX2Jsa2JhY2spLgoKT0ssIGFwcGxpZWQgd2l0aCBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+IAo+IHRoYW5rcywgCj4gCj4gLSBWYXNpbGlzCj4gCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
