From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/6] microcode: delete 'mc' field from
 struct ucode_cpu_info
Date: Wed, 28 Nov 2018 13:32:57 +0100
Message-ID: <20181128123257.r6e5vokqz7tszfk6@mac>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-4-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ir32=OH=citrix.com=prvs=8634c6f68=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gRz2t-00073R-25
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 12:34:23 +0000
Content-Disposition: inline
In-Reply-To: <1543383256-12371-4-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDE6MzQ6MTNQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYyBiL3hlbi9hcmNo
L3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+IGluZGV4IGM0ZjgxMmYuLjE4NTczMzIgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCj4gKysrIGIveGVuL2FyY2gveDg2
L21pY3JvY29kZV9pbnRlbC5jCj4gQEAgLTI5Niw5ICsyOTYsOCBAQCBzdGF0aWMgaW50IGdldF9t
YXRjaGluZ19taWNyb2NvZGUoY29uc3Qgdm9pZCAqbWMsIHVuc2lnbmVkIGludCBjcHUpCj4gICAg
ICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBj
cHUpOwo+ICAgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRl
ciA9IG1jOwo+ICAgICAgdW5zaWduZWQgbG9uZyB0b3RhbF9zaXplID0gZ2V0X3RvdGFsc2l6ZSht
Y19oZWFkZXIpOwo+IC0gICAgdm9pZCAqbmV3X21jOwo+ICAgICAgc3RydWN0IHVjb2RlX3BhdGNo
ICp1Y29kZV9wYXRjaCA9IHhtYWxsb2Moc3RydWN0IHVjb2RlX3BhdGNoKTsKPiAtICAgIHZvaWQg
Km5ld19tYzIgPSB4bWFsbG9jX2J5dGVzKHRvdGFsX3NpemUpOwo+ICsgICAgdm9pZCAqbmV3X21j
ID0geG1hbGxvY19ieXRlcyh0b3RhbF9zaXplKTsKPiAgCj4gICAgICAvKgo+ICAgICAgICogU2F2
ZSB0aGlzIG1pY3JvY29kZSBiZWZvcmUgY2hlY2tpbmcgdGhlIHNpZ25hdHVyZS4gSXQgaXMgdG8K
PiBAQCAtMzA5LDE2ICszMDgsMTYgQEAgc3RhdGljIGludCBnZXRfbWF0Y2hpbmdfbWljcm9jb2Rl
KGNvbnN0IHZvaWQgKm1jLCB1bnNpZ25lZCBpbnQgY3B1KQo+ICAgICAgICogSW5zdGVhZCwgdGhl
eSBqdXN0IGxvYWQgdGhlIG1hdGNoZWQgYW5kIGxhdGVzdCBtaWNyb2NvZGUgaW4KPiAgICAgICAq
IHRoZSBjYWNoZXMuCj4gICAgICAgKi8KPiAtICAgIGlmICggIXVjb2RlX3BhdGNoIHx8ICFuZXdf
bWMyICkKPiArICAgIGlmICggIXVjb2RlX3BhdGNoIHx8ICFuZXdfbWMgKQo+ICAgICAgewo+ICAg
ICAgICAgIHByaW50ayhLRVJOX0VSUiAibWljcm9jb2RlOiBlcnJvciEgQ2FuIG5vdCBhbGxvY2F0
ZSBtZW1vcnlcbiIpOwo+ICAgICAgICAgIHJldHVybiAtRU5PTUVNOwoKSSBrbm93IHRoaXMgaXMg
ZXhpdGluZyBjb2RlLCBidXQgaXQncyBsZWFraW5nIG1lbW9yeS4uLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
