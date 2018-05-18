From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/2] xen/PVH: Set up GS segment for stack
 canary
Date: Fri, 18 May 2018 01:31:32 -0600
Message-ID: <5AFE815402000078001C3E50__30669.8780660101$1526628619$gmane$org@prv1-mh.provo.novell.com>
References: <20180517144723.21585-1-boris.ostrovsky@oracle.com>
 <20180517144723.21585-2-boris.ostrovsky@oracle.com>
 <5AFD999402000078001C3B29@prv1-mh.provo.novell.com>
 <656c5250-3406-a98a-309c-ac3d7e3e4c41@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ji1r=if=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJZrS-0007tg-J7
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 07:31:34 +0000
In-Reply-To: <656c5250-3406-a98a-309c-ac3d7e3e4c41@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA1LjE4IGF0IDE5OjQ3LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA1LzE3LzIwMTggMTE6MDIgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAxNy4wNS4xOCBhdCAxNjo0NywgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IEBAIC02NCw2ICs2Nyw5IEBAIEVOVFJZKHB2aF9zdGFydF94ZW4pCj4+PiAgCW1vdiAlZWF4
LCVlcwo+Pj4gIAltb3YgJWVheCwlc3MKPj4+ICAKPj4+ICsJbW92ICRQVkhfQ0FOQVJZX1NFTCwl
ZWF4Cj4+PiArCW1vdiAlZWF4LCVncwo+PiBJIGRvdWJ0IHRoaXMgaXMgbmVlZGVkIGZvciA2NC1i
aXQgKHlvdSBjb3VsZCBlcXVhbGx5IHdlbGwgbG9hZCB6ZXJvIG9yIGxlYXZlCj4+IGluIHBsYWNl
IHdoYXQncyB0aGVyZSBpbiB0aGF0IGNhc2UpLAo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlz
LgoKVGhlIGFjdHVhbCBzZWxlY3RvciB2YWx1ZSBkb2Vzbid0IG1hdHRlciBvbiA2NC1iaXQuIEhl
bmNlIHlvdSBjb3VsZApvbWl0IHRoZSBsb2FkIGFsdG9nZXRoZXIsIG9yIHlvdSBjb3VsZCB1c2Ug
cGxhaW4gemVyby4gTm8gbmVlZCBmb3IgdGhlCihub24temVybykgc2VsZWN0b3IsIG9yIChieSBp
bXBsaWNhdGlvbikgdGhlIEdEVCBkZXNjcmlwdG9yLgoKPj4gIGFuZCBsb2FkaW5nIHRoZSBzZWxl
Y3RvciBiZWZvcmUgc2V0dGluZwo+PiB0aGUgYmFzZSBhZGRyZXNzIGluIHRoZSBkZXNjcmlwdG9y
IHdvbid0IGhhdmUgdGhlIGludGVuZGVkIGVmZmVjdC4KPiAKPiAKPiBJIHdhc24ndCBzdXJlIGFi
b3V0IHRoaXMgZWl0aGVyIGJ1dCB0aGVuIEkgbm90aWNlZCB0aGF0Cj4gc2Vjb25kYXJ5X3N0YXJ0
dXBfNjQoKSBkb2VzIGl0IGluIHRoZSBzYW1lIG9yZGVyIChhbHRob3VnaCBub3QgdXNpbmcgdGhl
Cj4gTVNSKS4KCldlbGwsIGZvciBvbmUgdGhleSBsb2FkIGEgbnVsbCBzZWxlY3Rvciwgd2hpY2gg
aXMgaW5kZXBlbmRlbnQgb2Ygc2V0dGluZyB1cAphbnkgR0RUIGRlc2NyaXB0b3JzLiBJIGFsc28g
ZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHNheSAiYWx0aG91Z2ggbm90CnVzaW5nIHRoZSBNU1Ii
IHdoZW4gdGhleSBjbGVhcmx5IGRvLiBBbmQgdGhlbiwgYXMgc2FpZCBhYm92ZSAoYW5kIGFsc28K
aW4gYSBjb21tZW50IGluIHNlY29uZGFyeV9zdGFydHVwXzY0KCkpLCB0aGUgYWN0dWFsIHNlbGVj
dG9yIHZhbHVlIChhbmQKd2hlbiAvIGlmIGF0IGFsbCBpdCBpcyBsb2FkZWQpIGRvZXNuJ3QgbWF0
dGVyIG9uIDY0LWJpdC4gVGhlIG9yZGVyaW5nIGRvZXMKbWF0dGVyIG9uIDMyLWJpdCB0aG91Z2gu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
