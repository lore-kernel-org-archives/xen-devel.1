From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 6/6] firmware/shim: fix build process to use
	POSIX find options
Date: Wed, 17 Jan 2018 16:24:27 +0000
Message-ID: <23135.30907.66445.273053@mariner.uk.xensource.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rlig=em=citrix.com=prvs=548fb5411=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ebqVw-0007F6-JX
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 16:24:36 +0000
In-Reply-To: <20180117094814.32772-7-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCA2LzZdIGZpcm13YXJlL3NoaW06IGZpeCBi
dWlsZCBwcm9jZXNzIHRvIHVzZSBQT1NJWCBmaW5kIG9wdGlvbnMiKToKPiBUaGUgLXByaW50ZiBm
aW5kIG9wdGlvbiBpcyBub3QgUE9TSVggY29tcGF0aWJsZSwgc28gcmVwbGFjZSBpdCB3aXRoCj4g
YW5vdGhlciBydW5lLgouLi4KPiAgCQkgIGNkICQoRCkvJChkKTsgXAo+IC0JCSAgZmluZCAkKFhF
Tl9ST09UKS8kKGQpLyAtdHlwZSBkIC1wcmludGYgIi4vJVBcbiIgfCAgeGFyZ3MgbWtkaXIgLXAp
OykKPiArCQkgIGZpbmQgJChYRU5fUk9PVCkvJChkKS8gLXR5cGUgZCAtZXhlYyBzaCAtYyBcCj4g
KwkJICAgICAgImVjaG8ge30gfCBzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdz
IG1rZGlyIC1wIiBcOyk7KQoKVGhpcyBpcyBub3cgYSBwcmV0dHkgbmFzdHkgc2hlbGwgY29uc3Ry
dWN0LgoKSWYgeW91J3JlIGdvaW5nIHRvIHVzZSBzZWQsIHlvdSBjb3VsZCBqdXN0CiAgIGZpbmQg
Li4uIC1wcmludCB8IHNlZCAuLi4gfCB4YXJncyBta2RpciAtcAoKU3Vic3RpdHV0aW5nIHt9IGlu
dG8gdGhlIG1pZGRsZSBvZiB0aGUgc2hlbGwgcnVuZSBpcyBiYWQgcHJhY3RpY2UgaW4KZ2VuZXJh
bCBiZWNhdXNlIGl0IG1pZ2h0IGNvbnRhaW4gbWV0YWNoYXJhY3RlcnMgb3Igc3BhY2VzLiAgSW4g
b3VyCmJ1aWxkIHN5c3RlbSB0aGlzIGRvZXNuJ3QgbWF0dGVyIGJlY2F1c2UgdGhhdCBicmVha3Mg
YW55d2F5LCBidXQgaXQncwp2ZXJ5IHBvb3Igc3R5bGUgKGFuZCBhbHNvIGl0IGJ1cmllcyB0aGUg
YWN0dWFsIGRhdGEgZmxvdyBwYXRoIGludG8gdGhlCm1pZGRsZSBvZiBhIGNvbXBsaWNhdGVkIG1h
bmdsZW1lbnQpLgoKSWYgeW91IHdhbnRlZCB0byB1c2UgLWV4ZWMgYW5kIHNoLCB5b3UgY291bGQg
ZG8gc29tZXRoaW5nIGxpa2UgdGhpcwogICAtZXhlYyBzaCAtYyAnZXhlYyBta2RpciAiJHsxIyQo
WEVOX1JPT1R9LyQoZCkvfSInIHgge30KbWF5YmUuCgpBbmQgZmluYWxseSwgSSBkb24ndCByZWFs
bHkgdW5kZXJzdGFuZCB3aHkgaXQgaXMgbmVjZXNzYXJ5IHRvIHN0cmlwCiQoWEVOX1JPT1QpLyQo
ZCkvIG91dCBhdCBhbGwuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
