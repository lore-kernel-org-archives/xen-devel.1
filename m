From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 02/18] xen/arm: Implement PSCI system
 suspend call (virtual interface)
Date: Wed, 14 Nov 2018 13:35:27 +0100
Message-ID: <0160c922-22fb-9ed9-5460-80c133516d4b@aggios.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-3-git-send-email-mirela.simonovic@aggios.com>
 <1c5ca0ad-ee3d-2936-b57d-0ded1415176d@arm.com>
 <CAKPH-Nge2EMDLihthEVGAO0gY8EACksuN6ch1ZJV6+t1JeK=JQ@mail.gmail.com>
 <d186185e-bd34-0603-37e1-aa2d843c9b08@arm.com>
 <alpine.DEB.2.10.1811131237341.8259@sstabellini-ThinkPad-X260>
 <508d2a46-a275-8a8f-087e-4b953b942425@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rzl2=nz=aggios.com=mirela.simonovic@srs-us1.protection.inumbo.net>)
 id 1gMuOJ-0001zD-Le
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 12:35:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id j26-v6so17106799wre.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 04:35:29 -0800 (PST)
In-Reply-To: <508d2a46-a275-8a8f-087e-4b953b942425@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Xen Devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKCk9uIDExLzE0LzIwMTggMTE6NDUgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToK
PiBIaSwKPgo+IE9uIDEzLzExLzIwMTggMjA6MzksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4gT24gTW9uLCAxMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBIb3dldmVy
LCB3aGF0IGlzIHRoZSBpc3N1ZSB3aXRoIHNhdmluZyBhbGwgdGhlIHJlZ2lzdGVycyBoZXJlPwo+
Pj4+Pgo+Pj4+Cj4+Pj4gV2UgbmVlZCB0byBzYXZlIGFyZ3VtZW50cyB0aGF0IGFyZSBwcm92aWRl
ZCBieSBhIGd1ZXN0IHdpdGggc3lzdGVtCj4+Pj4gc3VzcGVuZCBQU0NJIGNhbGwuIFRoZXNlIGFy
Z3VtZW50cyBhcmUgdGhlIGVudHJ5IHBvaW50IHRoYXQgbmVlZHMgdG8KPj4+PiBiZSBzYXZlZCBp
biBwcm9ncmFtIGNvdW50ZXIgYW5kIGNvbnRleHQgSUQgdGhhdCBuZWVkcyB0byBiZSBzYXZlZCBp
bgo+Pj4+IHgwL3IwLiBXZSBkb24ndCBoYXZlIHRoZXNlIGFyZ3VtZW50cyBoZXJlLiBDb250ZXh0
IHN3aXRjaCBoYXBwZW5zCj4+Pj4gYWZ0ZXIgcHJvY2Vzc2luZyB0aGUgc3lzdGVtIHN1c3BlbmQg
UFNDSSBjYWxsLCBzbyBpdCdzIHRvbyBsYXRlLgo+Pj4KPj4+IEl0IGRvZXMgbm90IGZlZWwgcmln
aHQgdG8gbW9kaWZ5IGN0eHRfc3dpdGNoe2Zyb20sdG99IGZvciAKPj4+IHN1c3BlbmQvcmVzdW1l
LiBJZgo+Pj4geW91IHdhbnQgdG8gcmVzZXQgdGhlIHZDUFUgc3RhdGUgYmVmb3JlIGJsb2NraW5n
IHRoZSB2Q1BVLCB0aGVuIHlvdSAKPj4+IHNob3VsZAo+Pj4gaW5zdGVhZAo+PgoKSSB0aGluayBp
dCdzIG5vdCBjbGVhciB3aGF0IHByb2JsZW0gYXJlIHdlIGRpc2N1c3NpbmcgaGVyZSwgYXQgbGVh
c3QgCml0J3Mgbm90IHRvIG1lLiBTbyBJJ2xsIG1ha2UgYW4gYXNzdW1wdGlvbiwgYW5kIHBsZWFz
ZSBjb3JyZWN0IG1lIGlmIEknbSAKd3JvbmcuCkluIHRoZSBwYXRjaGVzIHdlIHN1Ym1pdHRlZCwg
dGhlIFZDUFUgY29udGV4dCBpcyBub3QgcmVzZXQgaW4gCmN0eHRfc3dpdGNoe2Zyb20sdG99LiBN
eSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgeW91IHN1Z2dlc3RlZC9hc2tlZCB0byAKcmVzZXQgdGhl
IFZDUFUgY29udGV4dCB3aGVuIHN3aXRjaCBoYXBwZW5zLCBhbmQgSSBleHBsYWluZWQgd2h5IGlz
IHRoYXQgCm5vdCBwb3NzaWJsZSAtIGF0IGxlYXN0IG5vdCB3aXRob3V0IGFkZGl0aW9uYWwgY29k
ZSBjaGFuZ2VzLCB0aGF0IG1heSAKbm90IGJlIHNvIHNtYWxsLiBJIGFncmVlIHdpdGggQW5kcmV3
J3MgY29tbWVudCBpbiB0aGlzIHBlcnNwZWN0aXZlIC0gCnJlc2V0IG9mIFZDUFUgc2hvdWxkIG5v
dCAoYW5kIHJpZ2h0IG5vdyBjYW5ub3QpIGJlIGRvbmUgd2hlbiB0aGUgY29udGV4dCAKaXMgc3dp
dGNoZWQuCgo+PiBZb3UgbWlzc2VkIHRoZSBlbmQgb2YgdGhlIHN1Z2dlc3Rpb24gaGVyZQo+Cj4g
V2hvb3BzLiBJIG1lYW50IHRoYXQgaW5zdGVhZCB5b3Ugc2hvdWxkIHNhdmUgdGhlIGNvbnRleHQg
b2YgdGhlIHZDUFUgCj4gaW4gYWR2YW5jZSBvciByZXNldCB0aGUgdkNQVSB1c2luZyB0aGUgc3lz
dGVtIHJlZ2lzdGVycyBkaXJlY3RseS4KPgo+IEJ1dCBteSBwcmVmZXJlbmNlIGlzIHRvIHJlc2V0
IHRoZSB2Q1BVIHdoZW4geW91IHJlY2VpdmUgdGhlIHdha2UtdXAgCj4gaW50ZXJydXB0Lgo+CgpX
aXRob3V0IHlvdSBwcmVzZW50aW5nIG1vcmUgZGV0YWlscyBob3cgd291bGQgdGhhdCB3b3JrIEkg
Y2Fubm90IHJlYWxseSAKcHJvdmlkZSBhbnkgY29tbWVudCwgbm9yIHNheSB0aGF0IHlvdXIgcHJl
ZmVyZW5jZSBjb3VsZCB3b3JrIG9yIGJlIApiZXR0ZXIgY29tcGFyZWQgdG8gd2hhdCBpcyBpbiB0
aGlzIHNlcmllcy4gSG9uZXN0bHksIEkgZG9uJ3QgdW5kZXJzdGFuZCAKd2hhdCBleGFjdGx5IHlv
dSdyZSBwcm9wb3NpbmcsIGJlY2F1c2UgbW9yZSB0aGluZ3MgbmVlZHMgdG8gYmUgCnRoaW5rLXRo
cm91Z2ggYmV5b25kIHRoZSBwbGFjZSB0byBwdXQgYSBjb2RlLgpXZSBzdWJtaXR0ZWQgYSBjb2Rl
IHRoYXQgd29ya3MsIHdoaWNoIGlzIHZlcnkgZWxlZ2FudCBhbmQgbmljZSBpbiBteSAKb3Bpbmlv
biAoZmFpciB0byBzYXkgd2UgbWF5IG5vdCBzaGFyZSBvcGluaW9ucyBoZXJlKSwgYW5kIGRvZXMg
bm90IApyZXF1aXJlIGxvdHMgb2YgY29kZSBjaGFuZ2VzLiBTbyB0aGVyZSdzIHRoZSByZWZlcmVu
Y2UuCkNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3aHkgZG8geW91IHRoaW5rIHRoZSBwcm9wb3Nl
ZCBzb2x1dGlvbiBpcyBub3QgZ29vZD8KQW5kIHdoeSBkbyB5b3UgdGhpbmsgdGhhdCB3aGF0IHlv
dSdyZSBwcm9wb3NpbmcgaXMgYmV0dGVyPyBMZXRzIGJlIG1vcmUgCmNsZWFyIGhlcmUgLSBob3cg
ZXhhY3RseSB5b3UgcHJvcG9zZSB0byBpbXBsZW1lbnQgdGhhdD8KCkkgaGF2ZW4ndCB1bmRlcnN0
b29kIHNvIGZhciB3aHkgZG8geW91IHRoaW5rIHRoYXQgdGhlIHByb3Bvc2VkIGFwcHJvYWNoIApp
cyBub3QgZ29vZC4gTWF5YmUgdGhlIHdob2xlIGRpc2N1c3Npb24gZHJpZnRlZCBhIGJpdCBmb3Ig
bm8gcmVhc29uLgoKVGhhbmtzLApNaXJlbGEKCj4gQ2hlZXJzLAo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
