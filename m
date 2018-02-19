From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH 45/49] ARM: new VGIC: vgic-init:
	implement vgic_init
Date: Mon, 19 Feb 2018 15:58:42 +0000
Message-ID: <bcc16db0-6d19-8f02-5c5c-031103409dd3@arm.com>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-46-andre.przywara@linaro.org>
 <138c4502-e8df-9b8d-ab4a-e13f7469dbc1@arm.com>
 <669e370b-c8a4-92c0-02af-9fa2f00cf81c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xtql=fn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ennq3-0001Ya-28
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 15:58:47 +0000
In-Reply-To: <669e370b-c8a4-92c0-02af-9fa2f00cf81c@linaro.org>
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

CgpPbiAxOS8wMi8xOCAxNTo1MywgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gSGksCj4gCj4gT24g
MTkvMDIvMTggMTM6MjEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDA5LzAy
LzE4IDE0OjM5LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4+IFRoaXMgcGF0Y2ggYWxsb2NhdGVz
IGFuZCBpbml0aWFsaXplcyB0aGUgZGF0YSBzdHJ1Y3R1cmVzIHVzZWQgdG8gbW9kZWwKPj4+IHRo
ZSB2Z2ljIGRpc3RyaWJ1dG9yIGFuZCB2aXJ0dWFsIGNwdSBpbnRlcmZhY2VzLiBBdCB0aGF0IHN0
YWdlIHRoZQo+Pj4gbnVtYmVyIG9mIElSUXMgYW5kIG51bWJlciBvZiB2aXJ0dWFsIENQVXMgaXMg
ZnJvemVuLgo+Pj4KPj4+IFRoaXMgaXMgYmFzZWQgb24gTGludXggY29tbWl0IGFkMjc1YjhiYjFl
Niwgd3JpdHRlbiBieSBFcmljIEF1Z2VyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFBy
enl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiAgwqAgeGVuL2Fy
Y2gvYXJtL3ZnaWMvdmdpYy1pbml0LmMgfCAxOTcKPj4+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+Pgo+PiBUaGlzIGZpbGUgaXMgZXhwb3J0aW5nIGEgbG90IG9m
IGZ1bmN0aW9uLCBhbGwgdGhlIGNvcnJlc3BvbmRpbmcKPj4gcHJvdG90eXBlIHNob3VsZCBiZSBk
ZWNsYXJlZCB3aXRoaW4gdGhpcyBwYXRjaCBhcyB3ZWxsLgo+IAo+IEJ1dCB0aG9zZSBhcmUgaW1w
bGVtZW50YXRpb25zIG9mIGZ1bmN0aW9ucyB1c2VkIGJ5IFhlbiBjb2RlIGFscmVhZHksIGFuZAo+
IGFyZSBhbGwgZGVjbGFyZWQgaW4geGVuL2luY2x1ZGUvYXNtLWFybS92Z2ljLmguCj4gT3IgZGlk
IEkgbWlzcyBhbnk/CgpIbW1tIG5vLiBDYW4geW91IG1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlIHBsZWFzZT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
