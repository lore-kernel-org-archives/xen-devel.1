From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Mon, 13 May 2019 17:15:43 +0300
Message-ID: <afef10b4-a7e8-acf3-49f6-363cbaf52047@bitdefender.com>
References: <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
 <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
 <20181122170801.pzdoif2g73aamnmu@mac>
 <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <5BF7C36F02000078001FF3E1@prv1-mh.provo.novell.com>
 <cb265527-4a69-01d9-9089-60b4b4fab22a@bitdefender.com>
 <bdd2240b-f1e9-3671-d3a1-996accdbacea@bitdefender.com>
 <5CD97A01020000780022E283@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZP0k=TN=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQBk4-0008C3-Ur
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:15:48 +0000
In-Reply-To: <5CD97A01020000780022E283@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: aisaila@bitdefender.com, Andrew Cooper <andrew.cooper3@citrix.com>, Andrei LUTAS <vlutas@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xMy8xOSA1OjA2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMy4wNS4xOSBh
dCAxNTo1OCwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBPbiAxMS8yNy8x
OCAxMjo0OSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+Pj4+IFdpdGggYSBzdWZmaWNpZW50
bHkgY29tcGxldGUgaW5zbiBlbXVsYXRvciwgc2luZ2xlLXN0ZXBwaW5nIHNob3VsZAo+Pj4+IG5v
dCBiZSBuZWVkZWQgYXQgYWxsIGltby4gR3JhbnRlZCB3ZSdyZSBub3QgcXVpdGUgdGhlcmUgeWV0
IHdpdGgKPj4+PiB0aGUgZW11bGF0b3IsIGJ1dCB3ZSd2ZSBtYWRlIHF1aXRlIGEgYml0IG9mIHBy
b2dyZXNzLiBBcyBiZWZvcmUsCj4+Pj4gaWYgdGhlcmUgYXJlIHBhcnRpY3VsYXIgaW5zdHJ1Y3Rp
b25zIHlvdSBrbm93IG9mIHRoYXQgdGhlIGVtdWxhdG9yCj4+Pj4gZG9lc24ndCBoYW5kbGUgeWV0
LCBwbGVhc2Uga2VlcCBwb2ludGluZyB0aGVzZSBvdXQuIExhc3QgSSBrbm93Cj4+Pj4gd2VyZSBz
b21lIEFWWCBtb3ZlIGluc3RydWN0aW9ucywgd2hpY2ggaGF2ZSBsb25nIGJlZW4KPj4+PiBpbXBs
ZW1lbnRlZC4KPj4+IFRydWUsIEkgaGF2ZW4ndCBzZWVuIGVtdWxhdG9yIGlzc3VlcyBpbiB0aGF0
IHJlc3BlY3Qgd2l0aCBzdGFnaW5nIC0gdGhlCj4+PiBlbXVsYXRvciBhcHBlYXJzIGxhdGVseSB0
byBiZSBzdWZmaWNpZW50bHkgY29tcGxldGUuIFRoYW5rIHlvdSB2ZXJ5IG11Y2gKPj4+IGZvciB5
b3VyIGhlbHAgYW5kIHN1cHBvcnQgLSB3ZSdsbCBkZWZpbml0ZWx5IHBvaW50IG91dCB1bnN1cHBv
cnRlZAo+Pj4gaW5zdHJ1Y3Rpb25zIGlmIHdlIHNwb3Qgc29tZSBhZ2Fpbi4KPj4KPj4gV2UndmUg
Y29tZSBhY2Nyb3NzIGEgbmV3IGluc3RydWN0aW9uIHRoYXQgdGhlIGVtdWxhdG9yIGNhbid0IGhh
bmRsZSBpbgo+PiBYZW4gNC4xMy11bnN0YWJsZSB0b2RheToKPj4KPj4gdnBtYWRkd2QgeG1tNCx4
bW00LFhNTVdPUkQgUFRSIGRzOjB4NTEzZmJiMjAKPj4KPj4gUGVyaGFwcyB0aGVyZSBhcmUgcGxh
bnMgZm9yIHRoaXMgdG8gZ28gaW50byB0aGUgZW11bGF0b3IgYXMgd2VsbD8KPiAKPiBZb3UncmUg
a2lkZGluZz8gVGhpcyBpcyBhbHJlYWR5IGluIDQuMTIuMCwgYW5kIGlmIGl0IHdlcmVuJ3QgSSdt
IHN1cmUKPiB5b3UncmUgYXdhcmUgdGhlcmUgYXJlIGFib3V0IDQwIG1vcmUgQVZYNTEyIHBhdGNo
ZXMgcGVuZGluZwo+IHJldmlldy4KClJpZ2h0LCBJIGRpZCBpbmRlZWQgZm9yZ2V0IGFib3V0IHRo
ZSBwZW5kaW5nIHJldmlldyBwYXJ0LCBmb3Igc29tZSAKcmVhc29uIEkgd2FzIHN1cmUgdGhleSBt
YWRlIGl0IGluLiBJJ3ZlIGRvdWJsZS1jaGVja2VkIGFuZCB3ZSByZWFsbHkgYXJlIAp1c2luZyA0
LjEzLXVuc3RhYmxlIC0gYnV0IHdlJ3ZlIGFsc28gbWFkZSBjaGFuZ2VzIHRvIHRoZSBlbXVsYXRv
ciwgCndvcmtpbmcgb24gdGhlIHNlbmQtdm0tZXZlbnRzLWZyb20tdGhlLWVtdWxhdG9yIHBhdGNo
LCBzbyB3ZSdsbCByZXZlcnQgCnRvIGEgcHJpc3RpbmUgc3RhZ2luZyBhbmQgcmV0cnksIHRoZXJl
J3MgYSBjaGFuY2UgdGhpcyBoYXBwZW5zIGJlY2F1c2UgCm9mIG91ciBjaGFuZ2VzLgoKV2UnbGwg
ZmluZCBvdXQgd2hhdCdzIGdvaW5nIG9uIGV4YWN0bHkuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
