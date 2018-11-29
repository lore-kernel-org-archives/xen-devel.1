From: Juergen Gross <jgross@suse.com>
Subject: Re: Linux 4.19.5 fails to boot as Xen dom0
Date: Thu, 29 Nov 2018 10:41:25 +0100
Message-ID: <8faec76b-ab44-3148-165d-0f3c9f497de2__35208.4779915915$1543484414$gmane$org@suse.com>
References: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jnsg=oi=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gSIp7-0006G5-4T
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 09:41:29 +0000
In-Reply-To: <a9a32e52-f50f-7d1a-ade0-baa2348ad78a@knorrie.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hans van Kranenburg <hans@knorrie.org>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMTEvMjAxOCAwMjoyMiwgSGFucyB2YW4gS3JhbmVuYnVyZyB3cm90ZToKPiBIaSwKPiAK
PiBBcyBhbHNvIHNlZW4gYXQ6Cj4gaHR0cHM6Ly9idWdzLmRlYmlhbi5vcmcvY2dpLWJpbi9idWdy
ZXBvcnQuY2dpP2J1Zz05MTQ5NTEKPiAKPiBBdHRhY2hlZCB0aGVyZSBhcmUgdHdvIHNlcmlhbCBj
b25zb2xlIG91dHB1dCBsb2dzLiBPbmUgaXMgc3RhcnRpbmcgd2l0aAo+IFhlbiA0LjExIChmcm9t
IGRlYmlhbiB1bnN0YWJsZSkgYXMgZG9tMCwgYW5kIHRoZSBvdGhlciBvbmUgd2l0aG91dCBYZW4u
Cj4gCj4gWyAgICAyLjA4NTU0M10gQlVHOiB1bmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcg
cmVxdWVzdCBhdAo+IGZmZmY4ODhkOWZmZmMwMDAKPiBbICAgIDIuMDg1NjEwXSBQR0QgMjAwYzA2
NyBQNEQgMjAwYzA2NyBQVUQgMAo+IFsgICAgMi4wODU2NzRdIE9vcHM6IDAwMDAgWyMxXSBTTVAg
Tk9QVEkKPiBbICAgIDIuMDg1NzM2XSBDUFU6IDEgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3Qg
dGFpbnRlZAo+IDQuMTkuMC10cnVuay1hbWQ2NCAjMSBEZWJpYW4gNC4xOS41LTF+ZXhwMStwdmgx
Cj4gWyAgICAyLjA4NTgyM10gSGFyZHdhcmUgbmFtZTogSFAgUHJvTGlhbnQgREwzNjAgRzcsIEJJ
T1MgUDY4IDA1LzIxLzIwMTgKPiBbICAgIDIuMDg1ODk1XSBSSVA6IGUwMzA6cHRkdW1wX3dhbGtf
cGdkX2xldmVsX2NvcmUrMHgxZmQvMHg0OTAKPiBbLi4uXQoKVGhlIG9mZmVuZGluZyBzdGFibGUg
Y29tbWl0IGlzIDQwNzRjYTdkOGExODMyOTIxYzg2NWQyNTBiYmQwOGYzNDQxYjM2NTcKKCJ4ODYv
bW06IE1vdmUgTERUIHJlbWFwIG91dCBvZiBLQVNMUiByZWdpb24gb24gNS1sZXZlbCBwYWdpbmci
KSwgdGhpcwppcyBjb21taXQgZDUyODg4YWEyNzUzZTMwNjNhOWQzYTBjOWY3MmY5NGFhOTgwOWMx
NSB1cHN0cmVhbS4KCkN1cnJlbnQgdXBzdHJlYW0ga2VybmVsIGlzIGJvb3RpbmcgZmluZSB1bmRl
ciBYZW4sIHNvIGluIGdlbmVyYWwgdGhlCnBhdGNoIHNob3VsZCBiZSBmaW5lLiBVc2luZyBhbiB1
cHN0cmVhbSBrZXJuZWwgYnVpbHQgZnJvbSBhYm92ZSBjb21taXQKKHdpdGggdGhlIHRoZW4gbmVl
ZGVkIFhlbiBmaXh1cCBwYXRjaCAxNDU3ZDhjZjc2NjRmMzRjNGJhNTM0KSBpcyBmaW5lLAp0b28u
CgpLaXJpbGwsIGFyZSB5b3UgYXdhcmUgb2YgYW55IHByZXJlcXVpc2l0ZSBwYXRjaCBmcm9tIDQu
MjAgd2hpY2ggY291bGQgYmUKbWlzc2luZyBpbiA0LjE5LjU/CgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
