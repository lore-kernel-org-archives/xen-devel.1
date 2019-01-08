From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 03/15] argo: define argo_dprintk for
 subsystem debugging
Date: Tue, 08 Jan 2019 08:50:27 -0700
Message-ID: <5C34C6C3020000780020B5EA@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-4-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mQY=PQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggteD-0006HU-K8
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 15:50:33 +0000
In-Reply-To: <1546846968-7372-4-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDA4OjQyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IEEgY29udmVuaWVuY2UgZm9yIHdvcmtpbmcgb24gZGV2ZWxvcG1lbnQgb2YgdGhl
IGFyZ28gc3Vic3lzdGVtOgo+IHNldHRpbmcgYSAjZGVmaW5lIHZhcmlhYmxlIGVuYWJsZXMgYWRk
aXRpb25hbCBkZWJ1ZyBtZXNzYWdlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBD
bGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29tPgoKQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbmUgZnVydGhlciByZW1hcms6Cgo+IC0t
LSBhL3hlbi9jb21tb24vYXJnby5jCj4gKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKPiBAQCAtMTks
NiArMTksMTUgQEAKPiAgI2luY2x1ZGUgPHhlbi9lcnJuby5oPgo+ICAjaW5jbHVkZSA8eGVuL2d1
ZXN0X2FjY2Vzcy5oPgo+ICAKPiArLyogQ2hhbmdlIHRoaXMgdG8gI2RlZmluZSBBUkdPX0RFQlVH
IGhlcmUgdG8gZW5hYmxlIG1vcmUgZGVidWcgbWVzc2FnZXMgKi8KPiArI3VuZGVmIEFSR09fREVC
VUcKPiArCj4gKyNpZmRlZiBBUkdPX0RFQlVHCj4gKyNkZWZpbmUgYXJnb19kcHJpbnRrKGZvcm1h
dCwgYXJncy4uLikgcHJpbnRrKCJhcmdvOiAiIGZvcm1hdCwgIyMgYXJncyApCj4gKyNlbHNlCj4g
KyNkZWZpbmUgYXJnb19kcHJpbnRrKGZvcm1hdCwgLi4uICkgKCh2b2lkKTApCgpUaGlzIHdvdWxk
IGJldHRlciBiZSBhbiBpbmxpbmUgZnVuY3Rpb24sIHN1Y2ggdGhhdCBhcmd1bWVudHMgcGFzc2Vk
IGluCmFjdHVhbGx5IGdldCBldmFsdWF0ZWQuIE90aGVyd2lzZSB5b3UgcmlzayBvdmVybG9va2lu
ZyB2YXJpYWJsZXMgdXNlZApmb3Igc3VjaCBsb2dnaW5nIG9ubHksIGFuZCBpbiBwYXJ0aWN1bGFy
IHRoZSBjb21waWxlciB0aGVuIGlzc3VpbmcKd2FybmluZ3MgKGJyZWFraW5nIHRoZSBidWlsZCBk
dWUgdG8gLVdlcnJvcikuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
