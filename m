From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: Fix inconsistent callers of panic()
Date: Mon, 10 Sep 2018 12:21:00 +0100
Message-ID: <1a6403da-05ab-de07-f518-869c646c21e6@arm.com>
References: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535632297-29549-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMzAvMDgvMTggMTM6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gQ2Fs
bGVycyBhcmUgaW5jb25zaXN0ZW50IHdpdGggd2hldGhlciB0aGV5IHBhc3MgYSBuZXdsaW5lIHRv
IHBhbmljKCksCj4gaW5jbHVkaW5nIGFkamFjZW50IGNhbGxzIGluIHRoZSBzYW1lIGZ1bmN0aW9u
IHVzaW5nIGRpZmZlcmVudCBzdHlsZXMuCj4gCj4gcGFpbmMoKSBub3QgZXhwZWN0aW5nIGEgbmV3
bGluZSBpcyBpbmNvbnNpc3RlbnQgd2l0aCBtb3N0IG90aGVyIHByaW50aW5nCj4gZnVuY3Rpb25z
LCB3aGljaCBpcyBtb3N0IGxpa2VseSB3aHkgd2UndmUgZ2FpbmVkIHNvIG1hbnkgaW5jb25zaXN0
ZW5jaWVzLgo+IAo+IFN3aXRjaCBwYW5pYygpIHRvIGV4cGVjdCBhIG5ld2xpbmUsIGFuZCB1cGRh
dGUgYWxsIGNhbGxlcnMgd2hpY2ggY3VycmVudGx5Cj4gbGFjayBhIG5ld2xpbmUgdG8gaW5jbHVk
ZSBvbmUuCj4gCj4gVGhpcyBhY3R1YWxseSByZWR1Y2VzIHRoZSBzaXplIG9mIC5yb2RhdGEgKDB4
MDdlM2U4IGRvd24gdG8gMHgwN2UzYTgpIGJlY2F1c2UKPiBhIG51bWJlciBvZiBzdHJpbmdzIGFy
ZSBwYXNzZWQgdG8gYm90aCBwYW5pYygpIGFuZCBwcmludGsoKS4gIEFzIHRoZXkKPiBwcmV2aW91
c2x5IGRpZmZlcmVkIGJ5IFxuIGFsb25lLCB0aGV5IGNvdWxkbid0IGJlIG1lcmdlZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
