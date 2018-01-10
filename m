From: Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC PATCH 01/60] hyper_dmabuf: initial working
 version of hyper_dmabuf drv
Date: Wed, 10 Jan 2018 15:21:45 -0800
Message-ID: <20180110232145.GB19888__5831.52134572646$1515626687$gmane$org@downor-Z87X-UD5H>
References: <1513711816-2618-1-git-send-email-dongwon.kim@intel.com>
 <20171219232731.GA6497@downor-Z87X-UD5H>
 <b2e54171-ff9e-6c68-2a39-ec42988a1663@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7cvi=ef=intel.com=dongwon.kim@srs-us1.protection.inumbo.net>)
 id 1eZPkf-0003rd-Q1
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 23:25:45 +0000
Content-Disposition: inline
In-Reply-To: <b2e54171-ff9e-6c68-2a39-ec42988a1663@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Potrola,
 MateuszX" <mateuszx.potrola@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMjAsIDIwMTcgYXQgMDk6MTc6MDdBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyMC8xMi8xNyAwMDoyNywgRG9uZ3dvbiBLaW0gd3JvdGU6Cj4gPiBJIGZvcmdv
dCB0byBpbmNsdWRlIHRoaXMgYnJpZWYgaW5mb3JtYXRpb24gYWJvdXQgdGhpcyBwYXRjaCBzZXJp
ZXMuCj4gPiAKPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGNvbnRhaW5zIHRoZSBpbXBsZW1lbnRhdGlv
biBvZiBhIG5ldyBkZXZpY2UgZHJpdmVyLAo+ID4gaHlwZXJfZG1hYnVmLCB3aGljaCBwcm92aWRl
cyBhIG1ldGhvZCBmb3IgRE1BLUJVRiBzaGFyaW5nIGFjcm9zcwo+ID4gZGlmZmVyZW50IE9TZXMg
cnVubmluZyBvbiB0aGUgc2FtZSB2aXJ0dWFsIE9TIHBsYXRmb3JtIHBvd2VyZWQgYnkKPiA+IGEg
aHlwZXJ2aXNvci4KPiAKPiBTb21lIGdlbmVyYWwgcmVtYXJrcyByZWdhcmRpbmcgdGhpcyBzZXJp
ZXM6Cj4gCj4gWW91IGFyZSBzdGFydGluZyB0aGUgd2hvbGUgZHJpdmVyIGluIGRyaXZlcnMveGVu
LyBhbmQgaW4gdGhlIGxhc3QgcGF0Y2gKPiB5b3UgbW92ZSBpdCBvdmVyIHRvIGRyaXZlcnMvZG1h
LWJ1Zi8uIFdoeSBkb24ndCB5b3UgdXNlIGRyaXZlcnMvZG1hLWJ1Zi8KPiBmcm9tIHRoZSBiZWdp
bm5pbmc/IFRoZSBzYW1lIGFwcGxpZXMgdG8gZS5nLiBwYXRjaCAyMiBjaGFuZ2luZyB0aGUKPiBs
aWNlbnNlLiBQbGVhc2UgbWFrZSBpdCBlYXNpZXIgZm9yIHRoZSByZXZpZXdlcnMgYnkgbm90IGxl
dHRpbmcgdXMKPiByZXZpZXcgdGhlIGRldmVsb3BtZW50IGhpc3Rvcnkgb2YgeW91ciB3b3JrLgoK
WWVhaCwgSSB0cmllZCB0byBjbGVhbiB1cCBvdXIgZGV2ZWxvcGVtZW50IGhpc3RvcnkgYnV0IGJl
Y2F1c2Ugb2YKZGVwZW5kZW5jaWVzIGFtb25nIHBhdGNoZXMsIEkgY291bGRuJ3QgbWFrZSB0aG9z
ZSB0aGluZ3MgY2xlYXIgaW4gdGhlCmZpcnN0IHBsYWNlLgoKSSB3aWxsIHRyeSB0byBjbGVhbiB0
aGluZ3MgdXAgZnVydGhlci4KCj4gCj4gUGxlYXNlIHJ1biAuL3NjcmlwdHMvY2hlY2twYXRjaC5w
bCBvbiBlYWNoIHBhdGNoIGFuZCBjb3JyZWN0IHRoZSBpc3N1ZXMKPiBpdCBpcyByZXBvcnRpbmcu
IEF0IHRoZSBmaXJzdCBnbGFuY2UgSSd2ZSBzZWVuIHNldmVyYWwgc3R5bGUgcHJvYmxlbXMKPiB3
aGljaCBJIHdvbid0IGNvbW1lbnQgdW50aWwgdGhlIG5leHQgcm91bmQuCgpobW0uLiBJIHJhbiB0
aGUgc2NyaXB0IG9ubHkgb24gdGhlIGZpbmFsIHZlcnNpb24gYW5kIHRyeSB0byBmaXggYWxsIHRo
ZQppc3N1ZXMgYWZ0ZXIgdGhhdC4gSWYgaXQncyByZXF1aXJlZCBmb3IgaW5kaXZpZHVhbCBwYXRj
aGVzLCBJIHdpbGwgY2xlYW4KdXAgZXZlcnkgcGF0Y2ggb25jZSBhZ2Fpbi4KCj4gCj4gUGxlYXNl
IGFkZCB0aGUgbWFpbnRhaW5lcnMgYXMgQ2M6LCBub3Qgb25seSB0aGUgcmVsYXRlZCBtYWlsaW5n
IGxpc3RzLgo+IEFzIHlvdSBzZWVtIHRvIGFpbSBzdXBwb3J0aW5nIG90aGVyIGh5cGVydmlzb3Jz
IHRoYW4gWGVuIHlvdSBtaWdodCB3YW50Cj4gdG8gYWRkIHZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnIGFzIHdlbGwuCgpPaywgdGhhbmtzIQoKPiAKPiAKPiBKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
