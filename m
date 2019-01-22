From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 15/15] argo: validate hypercall arg
 structures via compat machinery
Date: Tue, 22 Jan 2019 04:08:05 -0700
Message-ID: <5C46F9950200007800210133@prv1-mh.provo.novell.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-16-git-send-email-christopher.w.clark@gmail.com>
 <5C3C874D020000780020D3D4@prv1-mh.provo.novell.com>
 <CACMJ4Gbcf9xXBATQsJtjx4LuiAxUXqjh8J3cevO+3x+6E-sZZQ@mail.gmail.com>
 <5C406633020000780020E9BC@prv1-mh.provo.novell.com>
 <CACMJ4Ga6-DsAnQSwM-TFJ+FSh0AHzNp44FORP6D5LVAKiu-s_Q@mail.gmail.com>
 <5C45B4F8020000780020FB47@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3rQ9=P6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gltuf-0004eM-4Y
 for xen-devel@lists.xenproject.org; Tue, 22 Jan 2019 11:08:13 +0000
In-Reply-To: <5C45B4F8020000780020FB47@prv1-mh.provo.novell.com>
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

Pj4+IE9uIDIxLjAxLjE5IGF0IDEzOjAzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDIwLjAxLjE5IGF0IDIyOjE4LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdy
b3RlOgo+PiBUaGUgIm5vIHJlcGVhdGVkIGNoZWNrcyIgcHJvYmxlbSBhbHNvIG9jY3VycyB3aGVu
IGFub3RoZXIgc2VwYXJhdGUKPj4gc3RydWN0IGNvbnRhaW5zIGEgZmllbGQgb2YgYSB0eXBlIHRo
YXQgaGFzIGFscmVhZHkgYmVlbiBjaGVja2VkOgo+PiB3aGljaGV2ZXIgQ0hFQ0sgaXMgcGVyZm9y
bWVkIHNlY29uZCB3aWxsIGJyZWFrLgo+PiAKPj4gZWcuCj4+IHR5cGVkZWYgc3RydWN0IHhlbl9h
cmdvX3JpbmdfZGF0YV9lbnQKPj4gewo+PiAgICAgc3RydWN0IHhlbl9hcmdvX2FkZHIgcmluZzsK
Pj4gICAgIHVpbnQxNl90IGZsYWdzOwo+PiAgICAgdWludDE2X3QgcGFkOwo+PiAgICAgdWludDMy
X3Qgc3BhY2VfcmVxdWlyZWQ7Cj4+ICAgICB1aW50MzJfdCBtYXhfbWVzc2FnZV9zaXplOwo+PiB9
IHhlbl9hcmdvX3JpbmdfZGF0YV9lbnRfdDsKPj4gCj4+IGFsc28gaGFzIGEgZmllbGQgb2YgdHlw
ZSB4ZW5fYXJnb19hZGRyLCB3aGljaCBwcm9kdWNlcyBDSEVDS19hcmdvX2FkZHIsCj4+IHdoaWNo
IHRoZW4gZmFpbHMgYmVjYXVzZSB0aGF0IHdhcyBhbHJlYWR5IHRlc3RlZCBpbgo+PiBDSEVDS19h
cmdvX3NlbmRfYWRkci4KPiAKPiBIbW0sIEkgdGhpbmsgdGhlIG1jaW5mbyBleGFtcGxlIGFib3Zl
IGNvbnRyYWRpY3RzIHRoaXMsIGJlY2F1c2UKPiBzdHJ1Y3QgbWNpbmZvX2NvbW1vbiBpcyB1c2Vk
IGJ5IG11bHRpcGxlIG90aGVyIHN0cnVjdHVyZXMuCgpEdWUgdG8KCkNIRUNLX21jaW5mb19jb21t
b247CiMgdW5kZWYgeGVuX21jaW5mb19jb21tb24KIyB1bmRlZiBDSEVDS19tY2luZm9fY29tbW9u
CiMgZGVmaW5lIENIRUNLX21jaW5mb19jb21tb24gICAgICAgICBzdHJ1Y3QgbWNpbmZvX2NvbW1v
bgoKd2hpY2ggSSB0aGluayB3b3VsZCBiZSBlYXN5IGVub3VnaCB0byB1c2UgaW4geW91ciBjYXNl
IGFzIHdlbGwKKHVudGlsIHdlIGNvdWxkIHBlcmhhcHMgZ2V0IGFyb3VuZCBhbmQgYWRkcmVzcyB0
aGUgdW5kZXJseWluZwppc3N1ZSwgYWxiZWl0IGl0J3Mgbm90IHJlYWxseSBjbGVhciB0byBtZSBo
b3cgdGhhdCBzaG91bGQgYmUgZG9uZSkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
