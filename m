From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Thu, 5 Jul 2018 16:14:39 +0100
Message-ID: <23358.13791.774484.444256@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <0c8301e7-f9a7-3936-ed82-f858f8edc285@suse.com>
 <AEC3807E-0EC4-4B77-8050-C58D98EA124D@citrix.com>
 <23357.64371.756397.906488@mariner.uk.xensource.com>
 <72BDCB6A-8544-4174-BFAC-432E085CC027@citrix.com>
 <b2d9e2b9-0eba-fade-0a32-d4e9ae04be0b@citrix.com>
 <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb5y0-0005cT-6F
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:14:44 +0000
In-Reply-To: <12bb9c34-424e-b9fd-6797-5f30fcd1be06@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "advisory-board@lists.xenproject.org" <advisory-board@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <George.Dunlap@citrix.com>, Rich Persaud <persaur@gmail.com>, "committers@xenproject.org" <committers@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW05vdGVzIGZvciB4ZW4gc3Vt
bWl0IDIwMTggZGVzaWduIHNlc3Npb25dIFByb2Nlc3MgY2hhbmdlczogaXMgdGhlIDYgbW9udGhs
eSByZWxlYXNlIENhZGVuY2UgdG9vIHNob3J0LCBTZWN1cml0eSBQcm9jZXNzLCAuLi4iKToKPiBT
YW1lIGFwcGxpZXMgdG8gdGhlIGhvc3Q6IHRoZSBiYXNlIHN5c3RlbSAod2l0aG91dCB0aGUgdG8g
YmUgdGVzdGVkCj4gY29tcG9uZW50IGxpa2UgcWVtdSwgeGVuLCBvciB3aGF0ZXZlcikgY291bGQg
YmUgaW5zdGFsbGVkIGp1c3QgYnkKPiBjbG9uaW5nIGEgZGlzay9wYXJ0aXRpb24vbG9naWNhbCB2
b2x1bWUuCgpDZXJ0YWlubHkgaXQgd291bGQgYmUgYSBiYWQgaWRlYSB0byB1c2UgYW55dGhpbmcg
Km9uIHRoZSB0ZXN0IGhvc3QKaXRzZWxmKiBhcyBhIGJhc2lzIGZvciBhIHN1YnNlcXVlbnQgdGVz
dC4gIFRoZSBwcmV2aW91cyB0ZXN0IG1pZ2h0CmhhdmUgY29ycnVwdGVkIGl0LgoKU28gdGhhdCBt
ZWFucyB0aGF0IG9mdGVuLCBhbmQgYXQgbGVhc3QgZnJvbSBvbmUgdGVzdCBmbGlnaHQgdG8gdGhl
Cm5leHQsIGFsbCBvZiB0aGUgYmFzZSBkb20wIE9TIG5lZWRzIHRvIGJlIGNvcGllZCBmcm9tIHNv
bWV3aGVyZSBlbHNlCnRvIHRoZSB0ZXN0IGhvc3QuICBUaGlzIGlzIG5vdCBjdXJyZW50bHkgYXMg
ZmFzdCBhcyBpdCBjb3VsZCBiZSwgYnV0CnJ1bm5pbmcgZC1pIGlzIG5vdCBtYXNzaXZlbHkgc2xv
d2VyIHRoYW4gc29tZXRoaW5nIGxpa2UgRkFJLgoKVG8gYSBmYWlybHkgbGFyZ2UgZXh0ZW50LCBz
aW1pbGFyIGNvbnNpZGVyYXRpb25zIGFwcGx5IHRvIGd1ZXN0CmltYWdlcy4KCj4gRWFjaCBpbWFn
ZSB3b3VsZCBydW4gdGhyb3VnaCB0aGUgc3RhZ2VzIG5ldy0+c3RhZ2luZy0+c3RhYmxlOgo+IAo+
IC0gRWFjaCB0aW1lIGEgY29tcG9uZW50IGlzIHJlbGVhc2VkIGFuIGltYWdlIGlzIGJhc2VkIG9u
IChlLmcuIGEgbmV3Cj4gICBtYWlubGluZSBrZXJuZWwpIGEgbmV3IGltYWdlIGlzIGNyZWF0ZWQg
YnkgaW5zdGFsbGluZyBpdC4gSW4gY2FzZSB0aGlzCj4gICBzdWNjZWVkcywgdGhlIGltYWdlIGlz
IG1vdmVkIHRvIHRoZSBzdGFnaW5nIGFyZWEuCgpUaGlzIHdvdWxkIGhhcHBlbiBhIGxvdCBtb3Jl
IG9mdGVuIHRoYW4geW91IHNlZW0gdG8gaW1hZ2UuICAiUmVsZWFlZCIKaGVyZSByZWFsbHkgbWVh
bnMgImlzIHVwZGF0ZWQgaW4gaXRzIGFwcHJvcHJpYXRlIGdpdCBicmFuY2giLgoKVW5sZXNzIHlv
dSB0aGluayB3ZSBzaG91bGQgZG8gb3VyIHRlc3Rpbmcgb2YgWGVuIG1haW5seSB3aXRoIHJlbGVh
c2VkCnZlcnNpb25zIG9mIExpbnV4IHN0YWJsZSBicmFuY2hlcyAoaW4gd2hpY2ggY2FzZSwgZ2l2
ZW4gaG93IExpbnV4CnN0YWJsZSBicmFuY2hlcyBhcmUgb2Z0ZW4gYnJva2VuLCB3ZSBtaWdodCBi
ZSBsb25nIG91dCBvZiBkYXRlKSwgb3IKb3VyIHRlc3Rpbmcgb2YgTGludXggb25seSB3aXRoIHBv
aW50IHJlbGVhc2VzIG9mIFhlbiwgZXRjLgoKVGhlIGN1cnJlbnQgYXBwcm9hY2ggaXMgbW9zdGx5
IHRvIHRha2UgdGhlIG1vc3QgcmVjZW50CnRlc3RlZC1hbmQtd29ya2luZyBnaXQgY29tbWl0IGZy
b20gZWFjaCBvZiB0aGUgaW5wdXRzLiAgVGhpcyBhc3BlY3Qgb2YKb3NzdGVzdCBnZW5lcmFsbHkg
d29ya3Mgd2VsbCwgSSB0aGluay4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
