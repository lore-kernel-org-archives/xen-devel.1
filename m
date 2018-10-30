From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 4/8] viridian: remove duplicate union types
Date: Tue, 30 Oct 2018 17:03:54 +0000
Message-ID: <bcf510da45e34a0b885fadf0517ac212@AMSPEX02CL03.citrite.net>
References: <20181029180211.2155-1-paul.durrant@citrix.com>
 <20181029180211.2155-7-paul.durrant@citrix.com>
 <20181030164009.mxz5jlo3tj3jx336@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kzyf=nk=citrix.com=prvs=834dfdc47=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gHXRQ-00021w-4d
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:04:32 +0000
In-Reply-To: <20181030164009.mxz5jlo3tj3jx336@mac.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZQo+IFNl
bnQ6IDMwIE9jdG9iZXIgMjAxOCAxNjo0MAo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJl
dyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaAo+IDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDQvOF0gdmlyaWRpYW46IHJlbW92ZSBkdXBsaWNhdGUg
dW5pb24KPiB0eXBlcwo+IAo+IE9uIE1vbiwgT2N0IDI5LCAyMDE4IGF0IDA2OjAyOjA3UE0gKzAw
MDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IFRoZSAndmlyaWRpYW5fdnBfYXNzaXN0JywgJ3Zp
cmlkaWFuX2h5cGVyY2FsbF9ncGEnIGFuZAo+ID4gJ3ZpcmlkaWFuX3JlZmVyZW5jZV90c2MnIHVu
aW9uIHR5cGVzIGFyZSBpZGVudGljYWwgaW4gbGF5b3V0LiBUaGUgbGF5b3V0Cj4gPiBpcyBhbHNv
IGNvbW1vbiB0aHJvdWdob3V0IHRoZSBzcGVjaWZpY2F0aW9uIFsxXS4KPiA+Cj4gPiBUaGlzIHBh
dGNoIGRlY2xhcmVzIGEgY29tbW9uICd2aXJpZGlhbl9wYWdlX21zcicgdHlwZSBhbmQgY29udmVy
dHMgdGhlCj4gcmVzdAo+ID4gb2YgdGhlIGNvZGUgdG8gdXNlIHRoYXQgdHlwZSBmb3IgYm90aCB0
aGUgaHlwZXJjYWxsIGFuZCBWUCBhc3Npc3QgcGFnZXMuCj4gCj4gSSBhZ3JlZSB3aXRoIHRoZSB1
bmlmaWNhdGlvbiBvZiB0aGUgdmlyaWRpYW5fcGFnZV9tc3Igc3RydWN0Lgo+IAo+ID4gQWxzbywg
cmVuYW1lICd2aXJpZGlhbl9ndWVzdF9vc19pZCcgdG8gJ3ZpcmlkaWFuX2d1ZXN0X29zX2lkX21z
cicgc2luY2UKPiBpdAo+ID4gYWxzbyBpcyBhIHVuaW9uIHJlcHJlc2VudGluZyBhbiBNU1IgdmFs
dWUuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gYQo+IAo+IElNTyAoYW5kIEkn
bSBub3QgdGhhdCBmYW1pbGlhciB3aXRoIHRoZSBjb2RlKSBhZGRpbmcgdGhvc2UgX21zcgo+IHBy
ZWZpeGVzIGhlcmUgZG9lc24ndCBzZWVtIHRvIGFkZCBhbnkgdmFsdWUgdG8gdGhlIGNvZGUsIHRo
ZXJlJ3MKPiBub3RoaW5nIE1TUiBzcGVjaWZpYyBpbiB0aG9zZSBzdHJ1Y3RzLCBhcGFydCBmcm9t
IHRoZWlyIHNpemUuCj4gCgpUaGVyZSBpcyBhY3R1YWxseS4uLiB0aGV5IGFyZSB1bmlvbnMgdGhh
dCByZXByZXNlbnQgdGhlIGxheW91dCBvZiBhbiBNU1IsIGUuZyBTZWUgc2VjdGlvbiAyLjYgIlJl
cG9ydGluZyB0aGUgR3Vlc3QgT1MgSWRlbnRpdHkiLgoKPiBJcyB0aGVyZSBhIHBsYW4gdG8gYWRk
IGEgbmV3IHN0cnVjdHVyZSBsaWtlIHZpcmlkaWFuX3BhZ2VfbW1pbyBvcgo+IHNpbWlsYXIgdGhh
dCByZXF1aXJlcyBzdWNoIHByZWZpeGVzIHRvIGJlIHByZXNlbnQ/Cj4gCgpObywgSSdtIG5vdCBh
bnRpY2lwYXRpbmcgV2luZG93cyBjb21tdW5pY2F0aW5nIHZpYSBhbiBNTUlPIHJlZ2lvbiwgYnV0
IEkncyBzdGlsbCBsaWtlIHRoZSBjYWxsIG91dCBzb21ldGhpbmcgdGhhdCByZXByZXNlbnRzIGEg
Yml0LWZpZWxkIGVuY29kaW5nIG9mIGFuIE1TUi4KCiAgUGF1bAoKPiBUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
