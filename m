From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] Maintainers,
 please tell us how to boot your machines!
Date: Wed, 20 Mar 2019 19:29:07 +0100
Message-ID: <8736nh1jt8.fsf@dusky.pond.sub.org>
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
 <875zsed86y.fsf@dusky.pond.sub.org>
 <20190320122108.GN11621@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6Lod=RX=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1h6fxk-0000bM-Sd
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 18:29:16 +0000
In-Reply-To: <20190320122108.GN11621@perard.uk.xensource.com> (Anthony
 PERARD's message of "Wed, 20 Mar 2019 12:21:08 +0000")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>, Stefano Stabellini <sstabellini@kernel.org>, Aleksandar Rikalo <arikalo@wavecomp.com>, Alexander Graf <agraf@suse.de>, =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>, Jan Kiszka <jan.kiszka@web.de>, Igor Mitsyanko <i.mitsyanko@gmail.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Chris Wulff <crwulff@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>, Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>, Aurelien Jarno <aurelien@aurel32.net>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyaXRlczoKCj4gT24g
VHVlLCBNYXIgMTksIDIwMTkgYXQgMDc6MzQ6NDVQTSArMDEwMCwgTWFya3VzIEFybWJydXN0ZXIg
d3JvdGU6Cj4+ICAgICA9IGh3L3hlbnB2L3hlbl9tYWNoaW5lX3B2LmMgPQo+PiAgICAgU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiAoc3VwcG9ydGVyOlg4NikKPj4g
ICAgIEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPiAoc3VwcG9ydGVy
Olg4NikKPj4gICAgIFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IChzdXBw
b3J0ZXI6WDg2KQo+PiAgICAgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIChvcGVuIGxp
c3Q6WDg2KQo+Cj4gVGhhdCBtYWNoaW5lIHJlcXVpcmVzIFhlbiB0byBiZSBzdGFydGVkIGFuZCBh
dCBsZWFzdCBvbmUgc2VydmljZSwKPiB4ZW5zdG9yZS4KPgo+IEluIGRvbTAsIHdoZW4gaXQncyB1
c2VkIHRvIGF0dGFjaCBtb3JlIGRpc2tzIHRvIGRvbTA6Cj4KPiAkUUVNVSAtTSB4ZW5wdiAteGVu
LWRvbWlkIDAgLXhlbi1hdHRhY2ggXAo+ICAgICAgICAgLW5hbWUgZG9tMCAtbm9ncmFwaGljICAt
ZGFlbW9uaXplIFwKPiAgICAgICAgIC1tb25pdG9yIC9kZXYvbnVsbCAtc2VyaWFsIC9kZXYvbnVs
bCAtcGFyYWxsZWwgL2Rldi9udWxsIFwKPiAgICAgICAgIC1ub2RlZmF1bHRzIC1uby11c2VyLWNv
bmZpZwo+Cj4gQ29tbXVuaWNhdGlvbiBpcyB0aGVuIGRvbmUgdmlhIHhlbnN0b3JlIHRvIGF0dGFj
aCBkaXNrcywgd2Ugd291bGQgdXNlCj4gYHhsIGJsb2NrLWF0dGFjaGAgZm9yIHRoYXQuCj4KPiBB
bm90aGVyIGV4YW1wbGUsIHdoZW4gd2Ugc3RhcnQgYSBndWVzdCBhbmQgd2FudCB0byBhdHRhY2gg
cWNvdyBkaXNrIGFuZAo+IFZOQy4gT3VyIHRvb2wgc3RhY2sgKHhsIC8gbGlieGwpIHdvdWxkIGZp
cnN0IGNyZWF0ZSB0aGUgZG9tYWluIHRoZW4KPiBzdGFydCBRRU1VOgo+Cj4gJFFFTVUgLW1hY2hp
bmUgeGVucHYgLXhlbi1kb21pZCA2IC14ZW4tYXR0YWNoIFwKPiAgICAgICAgIC1uYW1lIHB2LWFy
Y2ggXAo+ICAgICAgICAgLWNoYXJkZXYgc29ja2V0LGlkPWxpYnhsLWNtZCxwYXRoPS92YXIvcnVu
L3hlbi9xbXAtbGlieGwtNixzZXJ2ZXIsbm93YWl0IFwKPiAgICAgICAgIC1tb24gY2hhcmRldj1s
aWJ4bC1jbWQsbW9kZT1jb250cm9sIFwKPiAgICAgICAgIC1uby1zaHV0ZG93biAtbm9kZWZhdWx0
cyAtbm8tdXNlci1jb25maWcgXAo+ICAgICAgICAgLXZuYyAwLjAuMC4wOjAsdG89OTkgXAo+ICAg
ICAgICAgLWRpc3BsYXkgbm9uZSAtbSAxMDI0Cj4KPiBJcyB0aGF0IGVub3VnaCBpbmZvcm1hdGlv
bj8KCkF0IGEgZ2xhbmNlLCB5ZXMuICBUaGFua3MhCgo+IEFsc28sIHdlIGRvIGF1dG9tYXRlZCB0
ZXN0cyBvZiBRRU1VLiBJdCBpcyBkb25lIGJ5IGBvc3N0ZXN0JyBhbmQgdGhlCj4gcmVzdWx0cyBh
cmUgc2VudCB0byB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcuCj4gT25lIGV4YW1wbGUg
b2YgYSB0ZXN0IHJlc3VsdDoKPiAgICAgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTAzL21zZzAxNTc3Lmh0bWwKPgo+IFRoYW5rcywKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
