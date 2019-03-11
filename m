From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 2/7] common: avoid atomic read-modify-write
 accesses in map_vcpu_info()
Date: Mon, 11 Mar 2019 17:53:40 +0000
Message-ID: <d1c5d13d-90b3-94fd-5a8f-dc80f4ae4a56@arm.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C86916A020000780021D5F4@prv1-mh.provo.novell.com>
 <ff56f677-a300-a769-a021-b36192d47c3a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ahZP=RO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h3P7Q-0007xk-N9
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 17:53:44 +0000
In-Reply-To: <ff56f677-a300-a769-a021-b36192d47c3a@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMS8wMy8yMDE5IDE2OjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDExLzAz
LzIwMTkgMTY6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGVyZSdzIG5vIG5lZWQgdG8gc2V0
IHRoZSBldnRjaG5fcGVuZGluZ19zZWwgYml0cyBvbmUgYnkgb25lLiBTaW1wbHkKPj4gd3JpdGUg
ZnVsbCB3b3JkcyB3aXRoIGFsbCBvbmVzLgo+Pgo+PiBGb3IgQXJtIHRoaXMgcmVxdWlyZXMgZXh0
ZW5kaW5nIHdyaXRlX2F0b21pYygpIHRvIGFsc28gaGFuZGxlIDY0LWJpdAo+PiB2YWx1ZXM7IGZv
ciBzeW1tZXRyeSByZWFkX2F0b21pYygpIGdldHMgYWRqdXN0ZWQgYXMgd2VsbC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IAo+IChJJ2xs
IGxlYXZlIHRoZSBBUk0gYXNzZW1ibHkgdG8gSnVsaWVuIHRvIGNoZWNrIG92ZXIpCgpSZXZpZXdl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkkgY2FuIHF1ZXVlIHRo
aXMgc2VyaWVzIGluIG15IG5leHQgYnJhbmNoIG9uY2UgaXQgaXMgZnVsbHkgYWNrZWQuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
