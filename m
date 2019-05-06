From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
Date: Mon, 6 May 2019 10:34:04 +0200
Message-ID: <c54fb173-0381-786c-a95c-eabf0629de84@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-2-jgross@suse.com> <5CCFF004020000780022C0D4@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNZ4c-0000dG-98
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:34:10 +0000
In-Reply-To: <5CCFF004020000780022C0D4@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxMDoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBAQCAtMjA3LDYgKzI1MCwxNDEg
QEAgc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2ZyZWVfZG9tZGF0YShjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpzLAo+PiAgICAgICAgICBBU1NFUlQoIWRhdGEpOwo+PiAgfQo+PiAgCj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgKnNjaGVkX2FsbG9jX3BkYXRhKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIg
KnMsIGludCBjcHUpCj4+ICt7Cj4+ICsgICAgaWYgKCBzLT5hbGxvY19wZGF0YSApCj4+ICsgICAg
ICAgIHJldHVybiBzLT5hbGxvY19wZGF0YShzLCBjcHUpOwo+PiArICAgIGVsc2UKPj4gKyAgICAg
ICAgcmV0dXJuIE5VTEw7Cj4+ICt9Cj4gCj4gSW4gY2FzZXMgbGlrZSB0aGlzIG9uZSBJJ2QgbGlr
ZSB0byBhc2sgdGhhdCBlaXRoZXIgPzogYmUgdXNlZCwgb3IgdGhlIHBvaW50bGVzcwo+ICJlbHNl
IiBiZSBkcm9wcGVkLgoKRmluZSB3aXRoIG1lLiBJIGd1ZXNzIGFkYXB0aW5nIHRoZSBhbHJlYWR5
IGV4aXN0aW5nIGlubGluZSB3cmFwcGVycyB0bwp0aGF0IHNjaGVtZSB3aXRoIHRoZSBzYW1lIHBh
dGNoIGlzIG9rYXk/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
