From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 31/49] ARM: new VGIC: Add PENDING
	registers handlers
Date: Mon, 19 Feb 2018 15:43:46 +0000
Message-ID: <80bb4302-81c2-adef-b640-2c8b6596b70e@arm.com>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-32-andre.przywara@linaro.org>
 <41a0968b-d221-6447-6e04-940fd95d4d02@arm.com>
 <b1a4d914-cbf3-41b4-4fa3-5c7f1256c0da@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xtql=fn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ennbi-0000Qq-G8
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 15:43:58 +0000
In-Reply-To: <b1a4d914-cbf3-41b4-4fa3-5c7f1256c0da@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxOS8wMi8xOCAxNTozMiwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSGksCgpIaSBBbmRy
ZSwKCj4gT24gMTYvMDIvMTggMTc6MTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDkvMDIv
MTggMTQ6MzksIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBMb29w
IG92ZXIgYWxsIElSUXMgYWZmZWN0ZWQgYnkgdGhpcyByZWFkICovCj4+PiArwqDCoMKgIGZvciAo
IGkgPSAwOyBpIDwgbGVuICogODsgaSsrICkKPj4+ICvCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHN0cnVjdCB2Z2ljX2lycSAqaXJxID0gdmdpY19nZXRfaXJxKHZjcHUtPmRvbWFpbiwgdmNw
dSwgaW50aWQKPj4+ICsgaSk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBpcnFfaXNf
cGVuZGluZyhpcnEpICkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbHVlIHw9ICgxVSA8
PCBpKTsKPj4KPj4gRG9uJ3QgeW91IG5lZWQgdG8gcHJvcGFnYXRlIHRoZSB2YWx1ZSB0byB0aGUg
aGFyZHdhcmUgZm9yIHZpcnR1YWwKPj4gaW50ZXJydXB0IG1hcHBlZCB0byBwaHlzaWNhbCBpbnRl
cnJ1cHQ/Cj4gCj4gRG8geW91IG1lYW4gaW4gdGhlIHdyaXRlIGZ1bmN0aW9ucyBiZWxvdz8gKFRo
aXMgaXMgdGhlIHJlYWQgZnVuY3Rpb24sIEkKPiBkb24ndCBzZWUgaG93IHRoaXMgd291bGQgYXBw
bHkgaGVyZS4pCgpIbW1tIHllcy4gU29ycnkgSSBtaXNwbGFjZWQgdGhlIGNvbW1lbnQuCgo+IAo+
IEluIGNhc2UgeW91IG1lYW50IHRoZSB3cml0ZV9bY3NdcGVuZGluZygpIGZ1bmN0aW9uczoKPiBJ
IGRvbid0IHRoaW5rIHRoaXMgbWFrZXMgdG9vIG11Y2ggc2Vuc2UuIFdoeSB3b3VsZCB5b3Ugd2Fu
dCB0byB0cmlnZ2VyCj4gYW4gaGFyZHdhcmUgSVJRPyBBbGwgeW91IHdhbnQgaXQgaXMgdG8gZGVs
aXZlciBpdCB0byB0aGUgZ3Vlc3QsIHdoaWNoIGlzCj4gd2hhdCB0aG9zZSBmdW5jdGlvbnMgYmVs
b3cgZG8uIFNvIHdoYXQgZG8gSSBtaXNzIGhlcmU/CgpJbWFnaW5lIHlvdSBjbGVhciB0aGUgcGVu
ZGluZyBiaXQgb24gYW4gaGFyZHdhcmUgbWFwcGVkIGludGVycnVwdC4gSWYgCnlvdSBuZXZlciBj
bGVhciB0aGUgYWN0aXZlIGJpdCBvbiB0aGUgcGh5c2ljYWwgb25lLCB5b3Ugd2lsbCBuZXZlciAK
cmVjZWl2ZSB0aGF0IGludGVycnVwdCBhZ2Fpbi4KCkZvciBzZXR0aW5nIHBlbmRpbmcgYml0LCBJ
IGFtIG5vdCBlbnRpcmVseSBzdXJlLiBCdXQgaXQgbG9va3MgbGlrZSBLVk0gCmlzIGRvaW5nIGl0
IChzZWUgbGF0ZXN0IG1hc3RlcikuIFNvIEkgYW0gd29uZGVyaW5nIHdoeSBYZW4gaXMgZGl2ZXJn
aW5nIApoZXJlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
