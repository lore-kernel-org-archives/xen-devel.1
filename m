From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [BUG] pci: mixed allocation pf and non-pf PCI MEM
 BAR (OVMF crash)
Date: Mon, 08 Apr 2019 02:07:55 -0600
Message-ID: <5CAB015B0200007800225372@prv1-mh.provo.novell.com>
References: <alpine.GSO.2.00.1903310940430.7231@dmz.c-home.cz>
 <5CA1D2ED02000078002237F8@prv1-mh.provo.novell.com>
 <alpine.GSO.2.00.1904011458001.24233@dmz.c-home.cz>
 <7db19966-3f23-13a1-92f3-810772df013b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7db19966-3f23-13a1-92f3-810772df013b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Martin Cerveny <M.Cerveny@computer.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA0LjE5IGF0IDE5OjAwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQXMgdG8gaHZtbG9hZGVyLCBjb2V4aXN0aW5nIG9mIHByZWZldGNoYWJsZSBhbmQgbm9u
LXByZWZldGNoYWJsZSBCQVJzIGluCj4gYSBzaW5nbGUgYXBlcnR1cmUgaXMgcGVyZmVjdGx5IG5v
cm1hbCBmcm9tIFBDSSBzcGVjaWZpY2F0aW9uIHBvaW50IG9mCj4gdmlldyAoZS5nLiBzZWUgIlBD
SS1UTy1QQ0kgQlJJREdFIEFSQ0hJVEVDVFVSRSBTUEVDSUZJQ0FUSU9OLCBSRVYgMS4yIikuCgpB
ZnRlciBteSBlYXJsaWVyIHJlc3BvbnNlIEkgdG9vIGhhdmUgYmVlbiB0aGlua2luZyBhYm91dCB0
aGlzIHNvbWUKbW9yZS4gTG9va2luZyBhdCB0aGUgc3BlYywgSSBjYW4ndCBzZWVtIHRvIGZpbmQg
YW55IHN0YXRlbWVudCBlaXRoZXIKdG8gdGhlIGVmZmVjdCBvZiB3aGF0IHlvdSBzYXksIG9yIHRv
IHRoZSBlZmZlY3Qgb2YgdGhlIG9wcG9zaXRlLiBGcm9tCnRoZSB0ZXh0IG9uZSBtaWdodCBpbXBs
eSB0aGF0IHB1dHRpbmcgcHJlZmV0Y2hhYmxlIHJlZ2lvbnMgaW5zaWRlIGEKbm9uLXByZWZldGNo
YWJsZSBicmlkZ2Ugd2luZG93IG91Z2h0IHRvIGJlIGFjY2VwdGFibGUsIGFsYmVpdApwZXJoYXBz
IGluZWZmaWNpZW50LiBCdXQgb2YgY291cnNlIHRoYXQncyBsaW1pdGVkIHRvIGNhc2VzIHdoZXJl
IGFsbApCQVJzIGNhbiBiZSBmaXQgYmVsb3cgNEdiLgoKQnV0IEkgZG9uJ3QgdGhpbmsgdGhhdCBz
cGVjIGlzIGFwcGxpY2FibGUgaGVyZSBhdCBhbGwsIGFzIGxvbmcgYXMgd2UKZG9uJ3QgZW11bGF0
ZSBhbnkgUENJLXRvLVBDSSBicmlkZ2VzLiBUaGVyZSBhcmUgb25seSBhIGhvc3QgYnJpZGdlLAph
IFBDSS10by1JU0Egb25lLCBhbmQgYSAibWlzYyIgb25lICh0aGUgUE0gZnVuY3Rpb25zIG9mIFBJ
SVg0KQpyaWdodCBub3cuCgpJbiBhbnkgZXZlbnQgSSBhZ3JlZSB0aGF0IGF0IHByZXNlbnQgbWl4
aW5nIHR5cGVzIG91Z2h0IHRvIGJlIGZpbmUuClRoaXMgd291bGQgbGlrZWx5IGNoYW5nZSBvbmNl
IHdlIGZpbmFsbHkgZ2FpbiBzdXBwb3J0IGZvciBlbXVsYXRpbmcKc29tZXRoaW5nIGxpa2UgdGhl
IFEzNS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
