From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: possible I/O emulation state machine issue
Date: Thu, 29 Mar 2018 02:51:22 -0600
Message-ID: <5ABCC52A02000078001B70CD@prv1-mh.provo.novell.com>
References: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
 <9038fd3e-6726-0418-8ce6-e023efb9f012@citrix.com>
 <5AB4BB1E02000078001B5633@gwmail.emea.novell.com>
 <cee96de9e1e94475bc55b3add0f14a44@AMSPEX02CL03.citrite.net>
 <5AB4F4A102000078001B5815@gwmail.emea.novell.com>
 <45c762bb12af4d3289060a452a58e8ec@AMSPEX02CL03.citrite.net>
 <5AB8CE9602000078001B5F5F@prv1-mh.provo.novell.com>
 <af3e3bd283ec4ad89fc8bcfc956d3f1d@AMSPEX02CL03.citrite.net>
 <5ABBD7F202000078001B6E27@prv1-mh.provo.novell.com>
 <1c787264bd5f4be397b3a3b27479d0c2@AMSPEX02CL03.citrite.net>
 <5ABCA36E02000078001B6FF0@prv1-mh.provo.novell.com>
 <af290bdd375748d89b1c7d49c25ef922@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=fhp7=gt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1THJ-0005s5-QN
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 08:51:25 +0000
In-Reply-To: <af290bdd375748d89b1c7d49c25ef922@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE4IGF0IDEwOjQyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAyOSBNYXJjaCAyMDE4IDA3OjI3Cj4+IAo+PiBTdXBwcmVzc2luZyB0aGUgc3RkdmdhIHBvcnQg
aW50ZXJjZXB0cyBoYXMsIGJ0dywgbm90IGhlbHBlZCB0aGUKPj4gc2l0dWF0aW9uLgo+PiAKPiAK
PiBUaGF0IHN1cnByaXNlcyBtZS4gVGhlIHdob2xlIHN0cmluZyBlbXVsYXRpb24gc2hvdWxkIGdv
IG91dCB0byBRRU1VIHdpdGhvdXQgCj4gYmVpbmcgYnJva2VuIHVwIGluIHRoYXQgY2FzZSwgYW5k
IHNpbmNlIGl0J3MgYW4gb3V0c3cgSSBkb24ndCBzZWUgd2h5IHRoZXJlIAo+IHdvdWxkIGJlIGFu
eSByZXRyeSBvZiB0aGUgbGluZWFyLT5waHlzaWNhbCB0cmFuc2xhdGlvbiBkdXJpbmcgY29tcGxl
dGlvbi4KClNlZSB0aGUgcGF0Y2ggc2VudCBlYXJsaWVyOiBIVk1JT19tbWlvX2NvbXBsZXRpb24g
bWVhbnMgYSBmdWxsCnNlY29uZCAob3IgZnVydGhlcikgcnVuIHRocm91Z2ggdGhlIGVtdWxhdG9y
ICh3aGljaCB0aGF0IHBhdGNoCm5vdyBhdm9pZHMpLiBTYW1lIHdvdWxkIG9jY3VyIGZvciBhbiBp
bnNuIHJlYWRpbmcgYW5kIHdyaXRpbmcKbXVsdGlwbGUgbWVtb3J5IGxvY2F0aW9ucywgaWYgYXQg
bGVhc3QgdGhlIHNlY29uZCBvbmUgaXMgaW4gTU1JTy4KSW4gdGhhdCBjYXNlIHdlIGNhbid0IGF2
b2lkIHRoZSBjb21wbGV0aW9uIHRob3VnaCwgYXMgdGhlIGFjY2VzcwptYXkgYWRkaXRpb25hbGx5
IGhhdmUgYmVlbiBzcGxpdCAoYW5kIHdlIHN0aWxsIG5lZWQgdG8gZXhlY3V0ZQppdHMgbGF0ZXIg
cGFydChzKSkuIFRvIGZ1bGx5IGFkZHJlc3MgdGhpcywgSSBkb24ndCBzZWUgYSB3YXkgYXJvdW5k
CnJlY29yZGluZyBjb21wbGV0ZWQgc3RlcHMgKHdoaWNoIGlzIGdvaW5nIHRvIGJlIGEgcHJldHR5
IGludHJ1c2l2ZQpjaGFuZ2UgYXMgaXQgbG9va3MpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
