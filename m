From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH-for-4.10/4.11] libxl: don't set gnttab
 limits in soft reset case
Date: Mon, 28 Jan 2019 13:33:10 +0000
Message-ID: <20190128133310.3d2ou7iwrcrsotcx@zion.uk.xensource.com>
References: <20190117164059.29306-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoWa=QE=citrix.com=prvs=9248dae56=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1go72I-0004oH-Dj
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 13:33:14 +0000
Content-Disposition: inline
In-Reply-To: <20190117164059.29306-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jim Fehlig <jfehlig@suse.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDU6NDA6NTlQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBJbiBjYXNlIG9mIHNvZnQgcmVzZXQgdGhlIGdudHRhYiBsaW1pdCBzZXR0aW5nIHdp
bGwgZmFpbCwgc28gb21pdCBpdC4KPiBTZXR0aW5nIG9mIG1heCB2Y3B1IGNvdW50IGlzIHBvaW50
bGVzcyBpbiB0aGlzIGNhc2UsIHRvbywgc28gd2UgY2FuCj4gZHJvcCB0aGF0IGFzIHdlbGwuCj4g
Cj4gV2l0aG91dCB0aGlzIHBhdGNoIHNvZnQgcmVzZXQgd2lsbCBmYWlsIHdpdGg6Cj4gCj4gbGli
eGw6IGVycm9yOiBsaWJ4bF9kb20uYzozNjM6bGlieGxfX2J1aWxkX3ByZTogQ291bGRuJ3Qgc2V0
IGdyYW50IHRhYmxlIGxpbWl0cwo+IAo+IFJlcG9ydGVkLWJ5OiBKaW0gRmVobGlnIDxqZmVobGln
QHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiBUZXN0ZWQtYnk6IEppbSBGZWhsaWcgPGpmZWhsaWdAc3VzZS5jb20+CgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCj4gLS0tCj4gNC4xMiBpcyBub3QgYWZm
ZWN0ZWQgZHVlIHRvIEFuZHJldydzIGRvbWFpbiBjcmVhdGlvbiBpbnRlcmZhY2UgY2hhbmdlcywK
PiA0LjkgYW5kIGVhcmxpZXIgYXJlIG5vdCBhZmZlY3RlZCBkdWUgdG8geGNfZG9tYWluX3NldF9n
bnR0YWJfbGltaXRzKCkKPiBvbmx5IGhhdmluZyBiZWVuIGludHJvZHVjZWQgaW4gNC4xMC4KClRo
YW5rcyBmb3IgY2hlY2tpbmcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
