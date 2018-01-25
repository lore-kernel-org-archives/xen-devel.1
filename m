From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Xen Introspection, KPTI,
 and CR3 bit 63 leads to guest VMENTRY failures during introspection
Date: Fri, 26 Jan 2018 01:03:46 +0200
Message-ID: <cf9bfa43-6ca5-e260-c509-040b927390fa@bitdefender.com>
References: <CALn24pArgwLSBy7TO0j4gcqXdzJ5pqmW_koKP7-Lfg8FXrOZEQ@mail.gmail.com>
 <0052b33d-f0fe-ee91-892d-a63c8001c567@bitdefender.com>
 <CALn24pBf1UGbrqsSD_=abdM1U7X+vMuPd0q4KgYYH_tmd7mkAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CALn24pBf1UGbrqsSD_=abdM1U7X+vMuPd0q4KgYYH_tmd7mkAw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Bitweasil ." <bitweasil@cryptohaze.com>
Cc: andrew.cooper3@citrix.com, tamas@tklengyel.com, jbeulich@suse.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjYvMjAxOCAxMjoxNyBBTSwgQml0d2Vhc2lsIC4gd3JvdGU6Cj4gUmF6dmFuIC0KPiAK
PiBZZXMsIHRoYXQgcGF0Y2ggcmVzb2x2ZXMgdGhlIGlzc3Vlcy7CoCBQZXJmb3JtYW5jZSBpcyBh
YnlzbWFsIChhcwo+IGV4cGVjdGVkIHdpdGggYSBDUjMgc3dpdGNoIG9uIGV2ZXJ5IHN5c2NhbGwp
LCBidXQgdGhpbmdzIGJlaGF2ZSBwcm9wZXJseS4+Cj4gSmFuIC0KPiAKPiBJdCB0dXJucyBvdXQg
dGhhdCB1bnJlbGF0ZWQgY29kZSBpbiBteSBsaXZlcGF0Y2ggd2FzIGNhdXNpbmcgdGhlCj4gY3Jh
c2hpbmcgd2hlbiBJIGZpbHRlcmVkIHRoZSBoaWdoIGJpdCAtIEkgd2FzIG5vdCBwcm9wZXJseSBn
YXRpbmcgc29tZQo+IG90aGVyIENSMyBwcm9jZXNzaW5nIGNvZGUgaW4gdGhlIGxpdmVwYXRjaCwg
YW5kIHRoYXQgd2FzIGNhdXNpbmcgdGhlCj4gaW52YWxpZCBvcGNvZGUgZXJyb3JzLCBub3QgdGhl
IGZpbHRlcmVkIENSMyB2YWx1ZS7CoCBZb3UgYXJlIGNvcnJlY3QgdGhhdAo+IG1hc2tpbmcgdGhl
IGJpdCBzaG91bGQgbm90IGNhdXNlIGFueSBjb3JyZWN0bmVzcyBpc3N1ZXMsIG9ubHkKPiBwZXJm
b3JtYW5jZSBpc3N1ZXMuCj4gCj4gV2lsbCBvbmUgb2YgeW91IHRha2UgdXAgc3VibWl0dGluZyB0
aGlzIHBhdGNoIGludG8gdGhlIHByb3BlciBwbGFjZXM/wqAKPiBJJ20gYWZyYWlkIEknbSBub3Qg
dmVyeSBmYW1pbGlhciB3aXRoIHRoZSBYZW4gcGF0Y2ggc3VibWlzc2lvbiBwcm9jZXNzLgoKWWVz
LCBJJ2xsIHNlbmQgYSBwcm9wZXIgcGF0Y2guCgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGUgaXNz
dWUgb3V0LApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
