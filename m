From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 08/12] os-posix: Provide new
 -runas <uid>:<gid> facility
Date: Mon, 16 Apr 2018 18:17:46 +0200
Message-ID: <87tvsbm8gl.fsf@dusky.pond.sub.org>
References: <1520535787-6223-1-git-send-email-ian.jackson@eu.citrix.com>
 <1520535787-6223-9-git-send-email-ian.jackson@eu.citrix.com>
 <874lkfxfxt.fsf@dusky.pond.sub.org>
 <23252.44539.262716.947319@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k7d8=hf=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1f86pF-0000lU-5t
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 16:17:53 +0000
In-Reply-To: <23252.44539.262716.947319@mariner.uk.xensource.com> (Ian
 Jackson's message of "Mon, 16 Apr 2018 15:06:51 +0100")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyaXRlczoKCj4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3LiAgVGFraW5nIHlvdXIgY29tbWVudHMgb3V0IG9mIG9yZGVyIHNsaWdodGx5
Ogo+Cj4gTWFya3VzIEFybWJydXN0ZXIgd3JpdGVzICgiUmU6IFtRZW11LWRldmVsXSBbUEFUQ0gg
MDgvMTJdIG9zLXBvc2l4OiBQcm92aWRlIG5ldyAtcnVuYXMgPHVpZD46PGdpZD4gZmFjaWxpdHki
KToKPj4gW2NoYW5nZV9wcm9jZXNzX3VpZF0gaXMgdGhlIG9ubHkgdXNlciBvZiBAdXNlcl9wd2Qs
IEB1c2VyX3VpZCwgQHVzZXJfZ2lkLgo+PiAKPj4gSGF2ZSB5b3UgY29uc2lkZXJlZCByZXBsYWNp
bmcgZ2xvYmFsIEB1c2VyX3B3ZCBieSBAdXNlcl91aWQsIEB1c2VyX2dpZAo+PiBhbmQgQHVzZXJf
bmFtZT8gIC0tcnVuYXMgd2l0aCBudW1lcmljIHVpZCBhbmQgZ2lkIHdvdWxkIGxlYXZlIEB1c2Vy
X25hbWUKPj4gbnVsbC4KPgo+IFRoYXQgd291bGQgZGVmZXIgdGhlIGdldHB3bmFtIGZyb20gYXJn
dW1lbnQgcGFyc2luZyB0byBvc19zZXR1cF9wb3N0Lgo+IEkgdGhpbmsgdGhhdCdzIHVuZGVzcmlh
YmxlLgoKTm8gYXJndW1lbnQuICBCdXQgd2h5IGNhbid0IG9zX3BhcnNlX2NtZF9hcmdzKCkgY2Fs
bCBnZXRwd25hbSgpIGFzIGl0CmRvZXMgbm93LCB0aGVuIHN0b3JlIHVzZXJfcHdkLT5wd191aWQs
IC0+cHdfZ2lkIGFuZCAtPnB3X25hbWUgaW5zdGVhZCBvZgp1c2VyX3B3ZD8gIFN0b3JlIGEgbnVs
bCBuYW1lIHdoZW4gaXQgcGFyc2VzIHRoZSBhcmd1bWVudCBhcyBVSUQ6R0lELgoKPj4gSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+IHdyaXRlczoKPj4gPiAgc3RhdGljIHN0
cnVjdCBwYXNzd2QgKnVzZXJfcHdkOwo+PiA+ICtzdGF0aWMgdWlkX3QgdXNlcl91aWQgPSAodWlk
X3QpLTE7Cj4+ID4gK3N0YXRpYyBnaWRfdCB1c2VyX2dpZCA9IChnaWRfdCktMTsKPj4gCj4+IEFz
IHdlJ2xsIHNlZSBiZWxvdywgQHVzZXJfcHdkLT5wd191aWQsIEB1c2VyX3B3ZF9wd19naWQgdGFr
ZSBwcmVjZWRlbmNlCj4+IG92ZXIgQHVzZXJfdWlkLCBAdXNlcl9naWQuICBBd2t3YXJkLgo+Cj4g
TXkgcGF0Y2ggaGFzIHRoZSByaWdodCBiZWhhdmlvdXI6IGVhY2ggLXJ1bmFzIGNvbXBsZXRlbHkg
b3ZlcnJpZGVzIHRoZQo+IHByZXZpb3VzIG9uZS4gIC1ydW5hcyB0aGF0IHNldHMgdXNlcl97dWlk
LGdpZH0gYWx3YXlzIGNsZWFycyB1c2VyX3B3ZAo+IG9uIHRoZSB3YXkuICBTbyB1c2VyX3B3ZCBj
YW4gb25seSBiZSBzZXQgaWYgdGhlIG1vc3QgcmVjZW50IC1ydW5hcyB3YXMKPiBhIG5hbWUsIGFu
ZCB0aGVuIHdlIHNob3VsZCBob25vdXIgdGhlIG5hbWUuCj4KPiBUaGlzIGlzIHJhdGhlciBvYnNj
dXJlLiAgSSB0aGluayB5b3UgYXJlIHJpZ2h0IHRoYXQgdGhpcyBpcyBjb25mdXNpbmcuCj4gSXQg
b3VnaHQgdG8gYmUgY2xlYXJlci4KPgo+IEkgd2lsbAo+ICAgLSBhZGQgYSBjb21tZW50IG5leHQg
dG8gdGhlc2UgdGhyZWUgdmFyaWFibGVzIHNheWluZyB0aGV5IG11c3QKPiAgICAgYWxsIGJlIHNl
dCBhdCB0aGUgc2FtZSB0aW1lCj4gICAtIGV4cGxpY2l0bHkgKHJlZHVuZGFudGx5KSBjbGVhciB1
c2VyX3B3ZCBpbiBvc19wYXJzZV9ydW5hc191aWRfZ2lkCj4gICAtIGV4cGxpY2l0bHkgc2V0IHVz
ZXJfe3VpZCxnaWR9IHRvIC0xIHdoZW4gLXJ1bmFzIGdldHMgYQo+ICAgICBzdWNjZXNzIGZyb20g
Z2V0cHduYW0KPiAgIC0gYXNzZXJ0IGluIGNoYW5nZV9wcm9jZXNzX3VpZCB0aGF0IHRoZSBjb21i
aW5hdGlvbiBpcyBsZWdhbAoKWWVzLCB0aGF0J3MgYmV0dGVyLiAgQnV0IHBlcmhhcHMgeW91IGxp
a2UgbXkgaWRlYSBhYm92ZS4KClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
