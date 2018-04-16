From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 08/12] os-posix: Provide new
 -runas <uid>:<gid> facility
Date: Mon, 16 Apr 2018 20:06:59 +0200
Message-ID: <87po2zkou4.fsf@dusky.pond.sub.org>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520535787-6223-9-git-send-email-ian.jackson@eu.citrix.com>
 <874lkfxfxt.fsf@dusky.pond.sub.org>
 <23252.44539.262716.947319@mariner.uk.xensource.com>
 <87tvsbm8gl.fsf@dusky.pond.sub.org>
 <23252.54972.659826.276061@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k7d8=hf=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1f88Wy-0001ih-5a
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 18:07:08 +0000
In-Reply-To: <23252.54972.659826.276061@mariner.uk.xensource.com> (Ian
 Jackson's message of "Mon, 16 Apr 2018 18:00:44 +0100")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyaXRlczoKCj4gTWFya3VzIEFy
bWJydXN0ZXIgd3JpdGVzICgiUmU6IFtRZW11LWRldmVsXSBbUEFUQ0ggMDgvMTJdIG9zLXBvc2l4
OiBQcm92aWRlIG5ldyAtcnVuYXMgPHVpZD46PGdpZD4gZmFjaWxpdHkiKToKPj4gSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyaXRlczoKPj4gPiBUaGF0IHdvdWxkIGRlZmVy
IHRoZSBnZXRwd25hbSBmcm9tIGFyZ3VtZW50IHBhcnNpbmcgdG8gb3Nfc2V0dXBfcG9zdC4KPj4g
PiBJIHRoaW5rIHRoYXQncyB1bmRlc3JpYWJsZS4KPj4gCj4+IE5vIGFyZ3VtZW50LiAgQnV0IHdo
eSBjYW4ndCBvc19wYXJzZV9jbWRfYXJncygpIGNhbGwgZ2V0cHduYW0oKSBhcyBpdAo+PiBkb2Vz
IG5vdywgdGhlbiBzdG9yZSB1c2VyX3B3ZC0+cHdfdWlkLCAtPnB3X2dpZCBhbmQgLT5wd19uYW1l
IGluc3RlYWQgb2YKPj4gdXNlcl9wd2Q/ICBTdG9yZSBhIG51bGwgbmFtZSB3aGVuIGl0IHBhcnNl
cyB0aGUgYXJndW1lbnQgYXMgVUlEOkdJRC4KPgo+IE9oLCBJIHNlZS4gIEl0IHNlZW1zIGxlc3Mg
b2J2aW91cyB0byBtZSB0aGFuIHdoYXQgSSBoYXZlIGRvbmUsIGJ1dCBJCj4gY2FuIGRvIGl0IGxp
a2UgdGhhdCBpZiB5b3UgbGlrZS4KCkkganVzdCB3YW50ZWQgdG8gdG9zcyBvdXQgdGhlIGlkZWEu
ICBQbGVhc2UgdXNlIHlvdXIganVkZ2VubWVudCBhbmQgZG8KaXQgdGhlIHdheSB5b3UgbGlrZSBi
ZXR0ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
