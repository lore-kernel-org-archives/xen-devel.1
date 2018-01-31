From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v3 6/8] ARM: VGIC: factor out
	vgic_get_hw_irq_desc()
Date: Wed, 31 Jan 2018 16:25:02 +0000
Message-ID: <0928b290-4e39-03f3-78e2-148532a0bb98@linaro.org>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-7-andre.przywara@linaro.org>
 <41c4cb64-9504-f52d-56c3-1acc89e64c12@linaro.org>
 <4e43fe67-2618-0085-fd9b-f0209afa7983@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7zm5=e2=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1egvC8-0001W8-70
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 16:25:08 +0000
Received: by mail-wm0-x242.google.com with SMTP id f71so215761wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2018 08:25:06 -0800 (PST)
In-Reply-To: <4e43fe67-2618-0085-fd9b-f0209afa7983@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzMS8wMS8xOCAxNjoyNCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MzEvMDEvMTggMTY6MTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDI0LzAx
LzE4IDE4OjEwLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4+IEF0IHRoZSBtb21lbnQgd2UgaGFw
cGlseSBhY2Nlc3MgdGhlIFZHSUMgaW50ZXJuYWwgc3RydWN0IHBlbmRpbmdfaXJxCj4+PiAod2hp
Y2ggZGVzY3JpYmVzIGEgdmlydHVhbCBJUlEpIGluIGlycS5jLgo+Pj4gRmFjdG9yIG91dCB0aGUg
YWN0dWFsbHkgbmVlZGVkIGZ1bmN0aW9uYWxpdHkgdG8gbGVhcm4gdGhlIGFzc29jaWF0ZWQKPj4+
IGhhcmR3YXJlIElSUSBhbmQgbW92ZSB0aGF0IGludG8gZ2ljLXZnaWMuYyB0byBpbXByb3ZlIGFi
c3RyYWN0aW9uLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5w
cnp5d2FyYUBsaW5hcm8ub3JnPgo+Pj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gIMKgIHhlbi9hcmNoL2FybS9naWMtdmdp
Yy5jwqDCoMKgIHwgMTUgKysrKysrKysrKysrKysrCj4+PiAgwqAgeGVuL2FyY2gvYXJtL2lycS5j
wqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKy0tLS0tCj4+PiAgwqAgeGVuL2luY2x1ZGUvYXNtLWFy
bS92Z2ljLmggfMKgIDIgKysKPj4+ICDCoCAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMt
dmdpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKPj4+IGluZGV4IGQ0NGU0ZGFjZDMuLjNh
ZDk4ZGNkM2EgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMKPj4+IEBAIC00MTEsNiArNDExLDIxIEBAIHZvaWQg
Z2ljX2R1bXBfdmdpY19pbmZvKHN0cnVjdCB2Y3B1ICp2KQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBwcmludGsoIlBlbmRpbmcgaXJxPSVkXG4iLCBwLT5pcnEpOwo+Pj4gIMKgIH0KPj4+ICDCoCAr
c3RydWN0IGlycV9kZXNjICp2Z2ljX2dldF9od19pcnFfZGVzYyhzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3QgdmNwdQo+Pj4gKnYsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHZp
cnEpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgcGVuZGluZ19pcnEgKnA7Cj4+PiArCj4+PiAr
wqDCoMKgIGlmICggIXYgKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHYgPSBkLT52Y3B1WzBdOwo+Pgo+
PiBJIGRpc2xpa2UgdGhpcyBuZXcgZnVuY3Rpb24gaW4gdGhlIGN1cnJlbnQgc3RhdGUuIExldCdz
IGltYWdpbmUgc29tZW9uZQo+PiBkZWNpZGUgdG8gcGFzcyBhIFBQSSBidXQgbm8gdkNQVS4gVGhl
IHZDUFUgd291bGQgbm93IGJlIGRlZmF1bHQgdG8gdkNQVTAKPj4gYW5kIHBvdGVudGlhbGx5IHJl
dHVybmluZyB0aGUgd3JvbmcgaXJxX2Rlc2MgKGltYWdpbmUgUFBJIHBhc3N0aHJvdWdoCj4+IHN1
Y2ggYXMgZm9yIHRoZSB2dGltZXIpLgo+Pgo+PiBTbyB0aGUgY29kZSBuZWVkcyBhdCBsZWFzdCBj
aGVja2luZyB0aGUgdkNQVSBpcyBwYXNzZWQgaW4gdGhlIGNhc2Ugb2YgYQo+PiBQUEkuIEkgd291
bGQgYmUgaGFwcHkgd2l0aCBhbiBBU1NFUlQoKS4KPiAKPiBZZWFoLCBnb29kIHBvaW50LiBTb21l
dGhpbmcgbGlrZSBBU1NFUlQoIXYgJiYgdmlycSA+PSAzMiksIEkgZ3Vlc3M/CgpZZXMuIEl0IHNo
b3VsZCBiZSBlbm91Z2guCgpDaGVlcnMsCgoKPiBDaGVlcnMsCj4gQW5kcmUuCj4gCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
