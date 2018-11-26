From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V9 7/7] p2m: change_range_type: Only
 invalidate mapped gfns
Date: Mon, 26 Nov 2018 05:59:05 -0700
Message-ID: <5BFBEE1902000078001FFF88@prv1-mh.provo.novell.com>
References: <1542886828-11241-1-git-send-email-rcojocaru@bitdefender.com>
 <1542886828-11241-8-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRGTn-0003Be-PW
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 12:59:11 +0000
In-Reply-To: <1542886828-11241-8-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, george.dunlap@citrix.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDEyOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gY2hhbmdlX3JhbmdlX3R5cGUoKSBpbnZhbGlkYXRlcyBnZm4gcmFuZ2VzIHRvIGxhemls
eSBjaGFuZ2UgdGhlIHR5cGUKCldvdWxkIHlvdSBtaW5kIGNvcnJlY3RpbmcgdGhlIGZ1bmN0aW9u
IG5hbWUgaGVyZT8KCj4gb2YgYSByYW5nZSBvZiBnZm5zLCBhbmQgYWxzbyBtb2RpZmllcyB0aGUg
bG9nZGlydHkgcmFuZ2VzZXRzIG9mIHRoYXQKPiBwMm0uIEF0IHRoZSBtb21lbnQsIGl0IGNsaXBz
IGJvdGggZG93biBieSB0aGUgaG9zdHAybS4KPiAKPiBXaGlsZSB0aGlzIHdpbGwgcmVzdWx0IGlu
IGNvcnJlY3QgYmVoYXZpb3IsIGl0J3Mgbm90IGVudGlyZWx5IGVmZmljaWVudCwKPiBzaW5jZSBp
bnZhbGlkYXRlZCBlbnRyaWVzIG91dHNpZGUgdGhhdCByYW5nZSB3aWxsLCBvbiBmYXVsdCwgc2lt
cGx5IGJlCj4gbW9kaWZpZWQgYmFjayB0byAiZW1wdHkiIGJlZm9yZSBmYXVsdGluZyBub3JtYWxs
eSBhZ2Fpbi4KPiAKPiBTZXBhcmF0ZSBvdXQgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSB0d28gcmFu
Z2VzLiAgS2VlcCB1c2luZyB0aGUKPiBob3N0cDJtJ3MgbWF4X21hcHBlZF9wZm4gdG8gY2xpcCB0
aGUgbG9nZGlydHkgcmFuZ2VzLCBidXQgdXNlIHRoZQo+IGN1cnJlbnQgcDJtJ3MgbWF4X21hcHBl
ZF9wZm4gdG8gZnVydGhlciBjbGlwIHRoZSBpbnZhbGlkYXRpb24gcmFuZ2UKPiBmb3IgYWx0ZXJu
YXRlIHAybXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBjaXRyaXguY29tPgoKU3ViamVjdCB0byBwb3NzaWJsZSBhZGp1c3RtZW50cyBkdWUgdG8gY2hh
bmdlcyB0byBwYXRjaCA2ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
