From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: xen-4.12~rc1 in ub1804: no vfb objects in pv domU,
 bug or feature?
Date: Mon, 28 Jan 2019 18:05:20 +0000
Message-ID: <20190128180520.GA2306@perard.uk.xensource.com>
References: <CAHnBbQ_69nOP2NsSy0rtzbBocUJRHnBxnJ9AX7yaqH_dTg7FJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlrW=QE=citrix.com=prvs=924bf3092=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1goBHi-000813-9X
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 18:05:26 +0000
Content-Disposition: inline
In-Reply-To: <CAHnBbQ_69nOP2NsSy0rtzbBocUJRHnBxnJ9AX7yaqH_dTg7FJw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pry Mar <pryorm09@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMjcsIDIwMTkgYXQgMDI6MTU6NTJQTSAtMDgwMCwgUHJ5IE1hciB3cm90ZToK
PiBxZW11IGJ1aWxkIGNvbmZpZzoKPiBodHRwOi8vcGFzdGUuZGViaWFuLm5ldC9wbGFpbi8xMDYy
Nzc3Lwo+IAo+IGRvbVUgc3RhcnR1cCB0cmFjZToKPiBodHRwOi8vcGFzdGUuZGViaWFuLm5ldC9w
bGFpbi8xMDYyNzY4Lwo+Cj4gVGhpcyByZWxlYXNlIHVzZXMgcWVtdS0zLjAuMCB3aGljaCBoYXMg
YSBkZXBlbmRzIG9uIGxpYnhlbnRvb2xjb3JlLgo+IAo+IEluIHhlbi00LjExLjEgd2l0aCBxZW11
LTIuMTEuMiB2ZmIgb2JqZWN0cyAoVk5DKSBhbHdheXMgd29ya2VkIGluIHB2Cj4gZG9tVS4gT25s
eSBub3cgd2l0aCBxZW11LTMueCBpcyBpdCBmYWlsaW5nOiB0aGUgZG9tVSBzdG9wcyBhbmQgY2xv
c2VzLgoKVk5DIHdpdGggYSBQViBndWVzdCBzdGlsbCB3b3JrcyBmb3IgbWUsIHNvIHNvbWV0aGlu
ZyBlbHNlIGlzIGdvaW5nIG9uLgpUaGUgb3V0cHV0IG9mIGB4bCAtdnZ2YCAoZG9tVSBzdGFydHVw
IHRyYWNlKSBsb29rcyBmaW5lLCBiZXNpZGUgdGhlCmVycm9yIHRoYXQgc2F5IHFlbXUgZGlkbid0
IHN0YXJ0LgoKQ291bGQgeW91IHBhc3RlIGFsc28gdGhlIG91dHB1dCBvZiBRRU1VOiBhdCAvdmFy
L2xvZy94ZW4vcWVtdS1kbS1kZWJzaWQubG9nCihzb3JyeSwgbG9ncyBldmVyeXdoZXJlKQoKPiBJ
IHNlZSB0aGV5IGFyZSBwYXRjaGluZyB0b29scy9xZW11LXhlbi9jb25maWd1cmUgaGVyZToKPiBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MDEvbXNnMDE2OTYuaHRtbAoKVGhhdCBwYXRjaCBpc24ndCBpbXBvcnRhbnQuIEl0IHNob3VsZG4n
dCBjaGFuZ2UgYW55dGhpbmcgZm9yIHRoZQpxZW11LXN5c3RlbS0qIGJpbmFyaWVzLCBidXQgdGhp
bmdzIHdvdWxkIGNoYW5nZXMgZm9yIG90aGVycywgbGlrZQpxZW11LWltZywgaXQgd291bGRuJ3Qg
YmUgbGlua2VkIHRvIHhlbidzIGxpYnMgYW55bW9yZS4KClRoYW5rcywKCi0tIApBbnRob255IFBF
UkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
