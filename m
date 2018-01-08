From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/3] xen: remove tests for pvh mode in pure
 pv paths
Date: Mon, 8 Jan 2018 09:39:38 -0500
Message-ID: <c7521222-67fe-1d0d-8218-83fe79a3cbda@oracle.com>
References: <20170804113613.12028-1-jgross@suse.com>
 <20170804113613.12028-2-jgross@suse.com>
 <a1365690-ebd9-742b-c334-1d01b5462d2c@ipsumj.de>
 <69194ac9-f0b7-a60e-7bf3-42f96319d2c7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fog3=ed=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eYYaf-00082u-UL
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 14:39:53 +0000
In-Reply-To: <69194ac9-f0b7-a60e-7bf3-42f96319d2c7@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, HW42 <hw42@ipsumj.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAwMTo1MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNi8wMS8x
OCAwNjo1NSwgSFc0MiB3cm90ZToKPj4KPj4gTm90IHN1cmUgaWYgeW91IHByZWZlciB0byBjaGFu
Z2UgdGhlIGdyYW50LXRhYmxlIGNvZGUgb3IgdG8gcmV2ZXJ0IHRoaXMKPj4gcGFydCBvZiB0aGUg
Y29tbWl0LiBUaGUgcGF0Y2ggYmVsbG93IHdvcmtzIGZvciBtZToKPiBUaGUgcGF0Y2ggbG9va3Mg
ZmluZS4KPgo+PiBGcm9tOiBTaW1vbiBHYWlzZXIgPHNpbW9uQGludmlzaWJsZXRoaW5nc2xhYi5j
b20+Cj4+IERhdGU6IFNhdCwgNiBKYW4gMjAxOCAwNjo0MDozMiArMDEwMAo+PiBTdWJqZWN0OiBb
UEFUQ0hdIHhlbjogRml4IHtzZXQsY2xlYXJ9X2ZvcmVpZ25fcDJtX21hcHBpbmcgb24gYXV0b3Ry
YW5zbGF0aW5nCj4+ICBndWVzdHMKPj4KPj4gQ29tbWl0IDgyNjE2Zjk1OTlhNyAoInhlbjogcmVt
b3ZlIHRlc3RzIGZvciBwdmggbW9kZSBpbiBwdXJlIHB2IHBhdGhzIikKPj4gcmVtb3ZlZCB0aGUg
Y2hlY2sgZm9yIGF1dG90cmFuc2xhdGlvbiBmcm9tIHtzZXQsY2xlYXJ9X2ZvcmVpZ25fcDJtX21h
cHBpbmcKPj4gYnV0IHRob3NlIGFyZSBjYWxsZWQgYnkgZ3JhbnQtdGFibGUuYyBhbHNvIG9uIFBW
SC9IVk0gZ3Vlc3RzLgo+Pgo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNC4xNAo+
PiBGaXhlczogODI2MTZmOTU5OWE3ICgieGVuOiByZW1vdmUgdGVzdHMgZm9yIHB2aCBtb2RlIGlu
IHB1cmUgcHYgcGF0aHMiKQo+PiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBHYWlzZXIgPHNpbW9uQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCgpTaW1vbiwgY2FuIHlvdSBwbGVhc2UgcmVzZW5kIHRoaXMgYXMgYSBwcm9w
ZXIgcGF0Y2g/IFlvdSBvcmlnaW5hbCBwb3N0CnNlZW1zIHRvIGJlIHdoaXRlc3BhY2UgZGFtYWdl
ZCAoYW1vbmcgb3RoZXIgdGhpbmdzKS4KClRoYW5rcy4KLWJvcmlzCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
