From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.11] x86/SVM: Fix intercepted {RD,
 WR}MSR for the SYS{CALL, ENTER} MSRs
Date: Wed, 25 Apr 2018 00:49:39 -0600
Message-ID: <5AE0250302000078001BE396@prv1-mh.provo.novell.com>
References: <1524595891-4030-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1524595891-4030-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA0LjE4IGF0IDIwOjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3N2bS9zdm0uYwo+IEBAIC0xODgzLDYgKzE4ODMsMjIgQEAgc3RhdGljIGludCBzdm1f
bXNyX3JlYWRfaW50ZXJjZXB0KHVuc2lnbmVkIGludCBtc3IsIHVpbnQ2NF90ICptc3JfY29udGVu
dCkKPiAgICAgIHN3aXRjaCAoIG1zciApCj4gICAgICB7Cj4gICAgICBjYXNlIE1TUl9JQTMyX1NZ
U0VOVEVSX0NTOgo+ICsgICAgY2FzZSBNU1JfSUEzMl9TWVNFTlRFUl9FU1A6Cj4gKyAgICBjYXNl
IE1TUl9JQTMyX1NZU0VOVEVSX0VJUDoKClRoZXNlIHRocmVlIGRvIG5vdCByZXF1aXJlIHN5bmMt
aW5nLCBhcyB0aGVpciB2YWx1ZXMgYXJlbid0IHJlYWQgZnJvbSB0aGUgVk1DQi4KKFRoZXkgZG8g
cmVxdWlyZSBzeW5jLWluZyBvbiB0aGUgd3JpdGUgcGF0aCkuCgpJIGFsc28gZG9uJ3QgdGhpbmsg
dGhpcyBpcyBnb2luZyB0byBmdWxseSByZXNvbHZlIFJhenZhbidzIGlzc3VlIChub3QgdGhlIGxl
YXN0CmJlY2F1c2UgdGhlIGNvZGUgcGF0aHMgeW91IGFkanVzdCBhcmVuJ3QgaW52b2x2ZWQgaW4g
aGlzIHNjZW5hcmlvKTogQXMKcG9pbnRlZCBvdXQgaW4gYSBwcml2YXRlIG1haWwsIEkgdGhpbmsg
dm1jYl9pbl9zeW5jIG5lZWRzIHRvIHN0YXJ0IG91dCBhcwp0cnVlIGZvciBhIHZDUFUsIGFuZCBt
YXkgbmVlZCBzZXR0aW5nIHRvIHRydWUgdXBvbiBjb250ZXh0IHNldCBhbmQvb3IKcmVzZXQvaW5p
dCBlbXVsYXRpb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
