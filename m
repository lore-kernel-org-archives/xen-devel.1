From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] xen-netback: don't populate the hash cache
 on XenBus disconnect
Date: Thu, 28 Feb 2019 12:51:14 -0800 (PST)
Message-ID: <20190228.125114.10822000460043710.davem__35022.7808974282$1551387126$gmane$org@davemloft.net>
References: <1551363086-29652-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8/sX=RD=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1gzSeC-0002A0-KM
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 20:51:16 +0000
In-Reply-To: <1551363086-29652-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: igor.druzhinin@citrix.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CkRhdGU6IFRo
dSwgMjggRmViIDIwMTkgMTQ6MTE6MjYgKzAwMDAKCj4gT2NjYXNpb25hbGx5LCBkdXJpbmcgdGhl
IGRpc2Nvbm5lY3Rpb24gcHJvY2VkdXJlIG9uIFhlbkJ1cyB3aGljaAo+IGluY2x1ZGVzIGhhc2gg
Y2FjaGUgZGVpbml0aWFsaXphdGlvbiB0aGVyZSBtaWdodCBiZSBzb21lIHBhY2tldHMKPiBzdGls
bCBpbi1mbGlnaHQgb24gb3RoZXIgcHJvY2Vzc29ycy4gSGFuZGxpbmcgb2YgdGhlc2UgcGFja2V0
cyBpbmNsdWRlcwo+IGhhc2hpbmcgYW5kIGhhc2ggY2FjaGUgcG9wdWxhdGlvbiB0aGF0IGZpbmFs
bHkgcmVzdWx0cyBpbiBoYXNoIGNhY2hlCj4gZGF0YSBzdHJ1Y3R1cmUgY29ycnVwdGlvbi4KPiAK
PiBJbiBvcmRlciB0byBhdm9pZCB0aGlzIHdlIHByZXZlbnQgaGFzaGluZyBvZiB0aG9zZSBwYWNr
ZXRzIGlmIHRoZXJlCj4gYXJlIG5vIHF1ZXVlcyBpbml0aWFsaXplZC4gSW4gdGhhdCBjYXNlIFJD
VSBwcm90ZWN0aW9uIG9mIHF1ZXVlcyBndWFyZHMKPiB0aGUgaGFzaCBjYWNoZSBhcyB3ZWxsLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXgu
Y29tPgoKQXBwbGllZCBhbmQgcXVldWVkIHVwIGZvciAtc3RhYmxlLCB0aGFua3MuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
