From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [OSSTEST PATCH 1/3] ts-depriv-audit-qemu: Create
 complete /run/user in appropriate root
Date: Mon, 19 Nov 2018 17:24:30 +0000
Message-ID: <20181119172430.haptybxtb5s7fgz2@zion.uk.xensource.com>
References: <20181119162741.17663-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bhw3=N6=citrix.com=prvs=8540992c9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gOnIB-0003KS-GJ
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 17:24:59 +0000
Content-Disposition: inline
In-Reply-To: <20181119162741.17663-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDQ6Mjc6MzlQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gKiBVc2UgbWtkaXIgLXAsIHJhdGhlciB0aGFuIHRyeWluZyB0byBvbmx5IGNyZWF0ZSAv
cnVuL3VzZXIvJHVpZC4KPiAgIFRoYXQgaGVscHMgaWYgL3J1biBhbmQvb3IgL3J1bi91c2VyIGRv
IG5vdCBleGlzdCwgYXMgdGhleSBkbyBpbgo+ICAgbGlieGwtbWFkZSBjaHJvb3RzIHdpdGggcmVj
ZW50IGxpYnhsICh3aGljaCBnZXRzIHFlbXUgdG8gY2hyb290KS4KPiAKPiAqIERvIGFsbCBvZiB0
aGlzIGluIHRoZSByb290IGRpcmVjdG9yeSBvZiB0aGUgcWVtdSBwcm9jZXNzLCBub3Qgb3VyCj4g
ICBvd24gcm9vdCBkaXJlY3RvcnkuICBTbyBpdCB3b3JrcyBpZiBxZW11IGlzIGNocm9vdGVkLgo+
IAo+IENDOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gLS0tCj4g
IHRzLWRlcHJpdi1hdWRpdC1xZW11IHwgNyArKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3RzLWRlcHJpdi1h
dWRpdC1xZW11IGIvdHMtZGVwcml2LWF1ZGl0LXFlbXUKPiBpbmRleCA1ZDA5MzUwLi40ZTA3ZDc2
IDEwMDc1NQo+IC0tLSBhL3RzLWRlcHJpdi1hdWRpdC1xZW11Cj4gKysrIGIvdHMtZGVwcml2LWF1
ZGl0LXFlbXUKPiBAQCAtNDgsOSArNDgsMTAgQEAgRU5ECj4gICAgICAgICAgcXBpZD0kKHhlbnN0
b3JlLXJlYWQgL2xvY2FsL2RvbWFpbi8kZG9taWQvaW1hZ2UvZGV2aWNlLW1vZGVsLXBpZCkKPiAg
ICAgICAgICB1aWQ9JChpZCAtdSB4ZW4tcWVtdXVzZXItcmFuZ2UtYmFzZSkKPiAgICAgICAgICB1
aWQ9JCgoICR1aWQgKyAkZG9taWQgKSkKPiAtICAgICAgICB0ZXN0IC1kIC9ydW4vdXNlciB8fCBt
a2RpciAtbSAyNzU1IC9ydW4vdXNlcgo+IC0gICAgICAgIGlmIG1rZGlyIC1tIDI3MDAgL3J1bi91
c2VyLyR1aWQ7IHRoZW4KPiAtICAgICAgICAgICAgY2hvd24gJHVpZDpyb290IC9ydW4vdXNlci8k
dWlkCj4gKyAgICAgICAgcXJvb3Q9JChyZWFkbGluayAvcHJvYy84MTIzL3Jvb3QpCgo4MTIzPyBJ
IHRoaW5rIHlvdSBtZWFuICR1aWQgb3Igc29tZXRoaW5nLgoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
