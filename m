From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH SpectreV1+L1TF v4 03/11] config: introduce
 L1TF_LFENCE option
Date: Wed, 23 Jan 2019 13:24:06 +0000
Message-ID: <2e60f86f-8bf4-43dc-4343-8074667b6f6d@arm.com>
References: <1548244285-30813-1-git-send-email-nmanthey@amazon.de>
 <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MDDu=P7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gmIVq-0003Vn-BZ
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 13:24:14 +0000
In-Reply-To: <1548244285-30813-4-git-send-email-nmanthey@amazon.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMy8wMS8yMDE5IDExOjUxLCBOb3JiZXJ0IE1hbnRoZXkgd3JvdGU6Cj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaCBiL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMu
aAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9ub3NwZWMuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9ub3NwZWMuaAo+IEBAIC02OCwxMCArNjgsMTggQEAgc3RhdGljIGlubGluZSBib29sIGxmZW5j
ZV90cnVlKHZvaWQpIHsgcmV0dXJuIHRydWU7IH0KPiAgICNlbmRpZgo+ICAgCj4gICAvKgo+IC0g
KiBwcm90ZWN0IGV2YWx1YXRpb24gb2YgY29uZGl0aW9uYWwgd2l0aCByZXNwZWN0IHRvIHNwZWN1
bGF0aW9uCj4gKyAqIGFsbG93IHRvIHByb3RlY3QgZXZhbHVhdGlvbiBvZiBjb25kaXRpb25hbCB3
aXRoIHJlc3BlY3QgdG8gc3BlY3VsYXRpb24gb24geDg2Cj4gICAgKi8KPiAtI2RlZmluZSBldmFs
dWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICsjaWYgZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfTk9ORSkgfHwgIWRlZmluZWQo
Q09ORklHX1g4NikKPiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAoY29uZGl0
aW9uKQo+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19MMVRGX0xGRU5DRV9CT1RIKQo+ICsjZGVmaW5l
IGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgKCgoY29uZGl0aW9uKSAmJiBsZmVuY2VfdHJ1ZSgpKSB8fCAh
bGZlbmNlX3RydWUoKSkKPiArI2VsaWYgZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfVFJVRSkK
PiArI2RlZmluZSBldmFsdWF0ZV9ub3NwZWMoY29uZGl0aW9uKSAoKGNvbmRpdGlvbikgJiYgbGZl
bmNlX3RydWUoKSkKPiArI2VsaWYgZGVmaW5lZChDT05GSUdfTDFURl9MRkVOQ0VfSU5URVJNRURJ
QVRFKQo+ICsjZGVmaW5lIGV2YWx1YXRlX25vc3BlYyhjb25kaXRpb24pICh7IGJvb2wgcmVzID0g
KGNvbmRpdGlvbik7IHJtYigpOyByZXM7IH0pID4gKyNlbmRpZgoKTm9uZSBvZiB0aGUgY29uZmln
cyBhcmUgZGVmaW5lZCBvbiBBcm0sIHNvIGNhbiB0aGlzIGJlIG1vdmVkIGluIGFyY2gteDg2PwoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
