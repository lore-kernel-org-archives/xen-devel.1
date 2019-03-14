From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] xen-block:
 Replace qdict_put_obj() by qdict_put() where appropriate
Date: Thu, 14 Mar 2019 20:04:00 +0100
Message-ID: <87ef795lcv.fsf@dusky.pond.sub.org>
References: <20190313174433.12966-1-armbru@redhat.com>
 <20190314143808.GB17866@linux.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SoX0=RR=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1h4VeB-0006bf-1D
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 19:04:07 +0000
In-Reply-To: <20190314143808.GB17866@linux.fritz.box> (Kevin Wolf's message of
 "Thu, 14 Mar 2019 15:38:08 +0100")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Wolf <kwolf@redhat.com>
Cc: sstabellini@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org, paul.durrant@citrix.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

S2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4gd3JpdGVzOgoKPiBBbSAxMy4wMy4yMDE5IHVt
IDE4OjQ0IGhhdCBNYXJrdXMgQXJtYnJ1c3RlciBnZXNjaHJpZWJlbjoKPj4gUGF0Y2ggY3JlYXRl
ZCBtZWNoYW5pY2FsbHkgYnkgcmVydW5uaW5nOgo+PiAKPj4gICAgICQgc3BhdGNoIC0tc3AtZmls
ZSBzY3JpcHRzL2NvY2NpbmVsbGUvcW9iamVjdC5jb2NjaSBcCj4+ICAgICAgICAgICAgICAtLW1h
Y3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggXAo+PiAgICAgICAgICAgICAgLS1k
aXIgaHcvYmxvY2sgLS1pbi1wbGFjZQo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEFybWJy
dXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFdvbGYgPGt3
b2xmQHJlZGhhdC5jb20+CgpUaGFua3MhCgo+IFdoaWNoIHRyZWUgc2hvdWxkIHRoaXMgZ28gdGhy
b3VnaD8gVGhlIFhlbiBvbmU/CgpGaW5lIHdpdGggbWUuICBJIGNvdWxkIGFsc28gaW5jbHVkZSBp
dCBpbiBhICJtaXNjZWxsYW5lb3VzIGNsZWFudXAiIHB1bGwKcmVxdWVzdCBhbG9uZyB3aXRoIG90
aGVyIGNsZWFudXAgcGF0Y2hlcyBJIGdvdCBpbiBmbGlnaHQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
