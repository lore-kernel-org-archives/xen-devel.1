From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] rangeset: make inquiry functions tolerate
 NULL inputs
Date: Fri, 17 Aug 2018 03:41:31 -0600
Message-ID: <5B76984B02000078001DF4A8@prv1-mh.provo.novell.com>
References: <5B76934B02000078001DF480@prv1-mh.provo.novell.com>
 <20180817092923.4hmev4c75ckreu4c@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqbG9-0000w0-8h
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 09:41:33 +0000
In-Reply-To: <20180817092923.4hmev4c75ckreu4c@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDExOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgQXVnIDE3LCAyMDE4IGF0IDAzOjIwOjExQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBSYXRoZXIgdGhhbiBzcGVjaWFsIGNhc2luZyB0aGUgLT5pb21lbV9jYXBzIGNoZWNr
IGluIHg4NidzCj4+IGdldF9wYWdlX2Zyb21fbDFlKCkgZm9yIHRoZSBkb21feGVuIGNhc2UsIGxl
dCdzIGJlIG1vcmUgdG9sZXJhbnQgaW4KPj4gZ2VuZXJhbCwgYWxvbmcgdGhlIGxpbmVzIG9mIHJh
bmdlc2V0X2lzX2VtcHR5KCk6IEEgbmV2ZXIgYWxsb2NhdGVkCj4+IHJhbmdlc2V0IGNhbid0IHBv
c3NpYmx5IGNvbnRhaW4gb3Igb3ZlcmxhcCBhbnkgcmFuZ2UuCj4+IAo+PiBSZXBvcnRlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IExHVE06Cj4gCj4gUmV2aWV3
ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoK
PiBBcyBzYWlkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgdGhpcyBpcyBkb25lIHRvIGF2b2lkIGFu
IGV4dHJhIGNoZWNrIGluCj4gZ2V0X3BhZ2VfZnJvbV9sMWUgSSBhc3N1bWUsIHNvIHNob3VsZCB0
aGUgZXh0cmEgY2hlY2sgYWxzbyBiZSBkcm9wcGVkCj4gaGVyZT8KCkknbSBhZnJhaWQgSSBkb24n
dCB1bmRlcnN0YW5kOiBJIGluZGVlZCBtZWFuIHRvIGF2b2lkIGFkZGluZyBhCk5VTEwgY2hlY2sg
aW4gZ2V0X3BhZ2VfZnJvbV9sMWUoKS4gQnV0IHdoYXQgY2hlY2sgYXJlIHlvdSB0aGlua2luZwpv
ZiB0aGF0IGNvdWxkIGJlIGRyb3BwZWQ/IE9yIGluIG90aGVyIHdvcmRzLCB3aGF0IGlzICJoZXJl
IiBpbgp5b3VyIHJlcGx5PwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
