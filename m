From: Manish Jaggi <mjaggi@caviumnetworks.com>
Subject: Re: [RFC 06/11] fwnode xen spacific changes
Date: Tue, 6 Mar 2018 19:14:30 +0530
Message-ID: <b9b897e0-a02a-f95a-fd7a-7b367cb6ed5b@caviumnetworks.com>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-7-manish.jaggi@linaro.org>
 <521998b8-1179-bc87-db7b-a4e3aee0c644@linaro.org>
 <e83d1ac0-48c1-92f9-590f-b894bc1f43f0@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fk6h=f4=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1etCtb-0004hO-4Y
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 13:44:47 +0000
In-Reply-To: <e83d1ac0-48c1-92f9-590f-b894bc1f43f0@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manish Jaggi <manish.jaggi@linaro.org>, Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, andre.przywara@linaro.org
Cc: Jan Beulich <JBeulich@suse.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKCk9uIDAxLzE5LzIwMTggMTI6MjEgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZGV2aWNlLmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL2RldmljZS5oCj4+IGluZGV4IDY3MzRhZThlZmQuLmY3ODQ4MmNhMGMgMTAwNjQ0
Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZGV2aWNlLmgKPj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9kZXZpY2UuaAo+PiBAQCAtNiw2ICs2LDggQEAKPj4gwqAgZW51bSBkZXZpY2Vf
dHlwZQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgREVWX0RULAo+PiArwqDCoMKgIERFVl9BQ1BJLAo+
Cj4gWW91IGRvbid0IHVzZSBERVZfQUNQSSBpbiB0aGlzIHBhdGNoLiBTbyB3aHkgaXMgdGhlcmU/
Cj4KPj4gK8KgwqDCoCBERVZfUENJLAo+PiDCoCB9Owo+PiDCoCDCoCBzdHJ1Y3QgZGV2X2FyY2hk
YXRhIHsKPj4gQEAgLTE4LDggKzIwLDEzIEBAIHN0cnVjdCBkZXZpY2UKPj4gwqDCoMKgwqDCoCBl
bnVtIGRldmljZV90eXBlIHR5cGU7Cj4+IMKgICNpZmRlZiBDT05GSUdfSEFTX0RFVklDRV9UUkVF
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGR0X2RldmljZV9ub2RlICpvZl9ub2RlOyAvKiBVc2VkIGJ5
IGRyaXZlcnMgaW1wb3J0ZWQgCj4+IGZyb20gTGludXggKi8KPgo+IEFzIHNhaWQgb24gU2FtZWVy
J3MgcGF0Y2hlcywgSSB3YXMgZXhwZWN0aW5nIGEgdG9kbyBpbiB0aGUgY29kZSBhZnRlciAKPiB0
aGUgZGlzY3Vzc2lvbiBhYm91dCBsZWF2ZSBvZl9ub2RlIGhlcmUuIApJIHRoaW5rIHlvdSBhcmUg
cmVmZXJyaW5nIHRvIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTk2MzEwOS8K
Q291bGQgeW91IHBsZWFzZSBhZGQgd2hhdCBUT0RPIHlvdSB3aXNoIHRvIGFkZCA/CgpJIGNvdWxk
IG5vdCBmaW5kwqAgYW55IGRpc2N1c3Npb24gb24gb2Zfbm9kZSBpbiB0aGUgbWFpbCBjaGFpbgoK
Ci1SZWdhcmRzCk1hbmlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
