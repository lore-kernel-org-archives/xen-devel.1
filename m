From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] x86/alternative: Implement NMI/#MC-safe
 patching
Date: Wed, 31 Jan 2018 10:32:29 +0000
Message-ID: <4b202f86-fb2c-586c-0f8a-ceb13c9fa077@citrix.com>
References: <1517240291-32409-1-git-send-email-andrew.cooper3@citrix.com>
 <1517240291-32409-5-git-send-email-andrew.cooper3@citrix.com>
 <5A703D5602000078001A3A1B@prv-mh.provo.novell.com>
 <4fcd2069-5e5d-2bec-512a-86e04d83b669@citrix.com>
 <68659d33-37b2-60da-35df-45d0f98c1c06@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <68659d33-37b2-60da-35df-45d0f98c1c06@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: RossLagerwall <ross.lagerwall@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDEvMTggMDY6MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMzAvMDEvMTggMjA6
MjYsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IEhvd2V2ZXIsIHRoZXJlIGlzIGxpdGVyYWxseSBu
b3RoaW5nIHdlIGNhbiBkbyB0byBwcmV2ZW50ICNNQyBmcm9tCj4+IGFycml2aW5nLsKgIFdlIGNh
biBzdG9wIHNlcnZpY2luZyAjTUMgYnkgZGlzYWJsaW5nIENSNC5NQ0UsIGJ1dCB0aGVuIHRoZQo+
PiBwcm9jZXNzb3Igd2lsbCBzaHV0IGRvd24uCj4gSG1tLCB0aGVyZSBpcyBhIHdheSB0byBhdm9p
ZCAjTUMgb24gb3RoZXIgcHJvY2Vzc29ycywgYnV0IHRoaXMKPiByZXF1aXJlcyB0aGUgcmVhbGx5
IGJpZyBoYW1tZXI6IHN0b3AgYWxsIG90aGVyIGNwdXMgYW5kIHJlc3RhcnQKPiB0aGVtIGFmdGVy
IHBhdGNoaW5nLgoKSSB0aGluayB0aGF0IGZpcm1seSBnb2VzIG9uIHRoZSBwaWxlIG9mICJ3b3Jz
ZSB0aGFuIGRvaW5nIG5vdGhpbmciIDopCgpBbHNvLCBpdCBkb2Vzbid0IHNvbHZlIHRoZSBwcm9i
bGVtIG9mICNNQyBhcnJpdmluZyBvbiB0aGUgY3VycmVudCBwcm9jZXNzb3IuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
