From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 06/12] x86: add a xpti command line
	parameter
Date: Tue, 30 Jan 2018 17:51:57 +0100
Message-ID: <760084ed-c900-f325-5f8b-6216c9f599a7@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-7-jgross@suse.com> <5A709FDF02000078001A3C2C@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=6aaf=ez=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1egZ8f-0003Nq-Ev
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 16:52:05 +0000
In-Reply-To: <5A709FDF02000078001A3C2C@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMTggMTY6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAxLjE4IGF0
IDEzOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTIxMiw2ICsyNDksMjQgQEAg
aW50IHB2X2RvbWFpbl9pbml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBk
b21jcl9mbGFncywKPj4gICAgICAvKiA2NC1iaXQgUFYgZ3Vlc3QgYnkgZGVmYXVsdC4gKi8KPj4g
ICAgICBkLT5hcmNoLmlzXzMyYml0X3B2ID0gZC0+YXJjaC5oYXNfMzJiaXRfc2hpbmZvID0gMDsK
Pj4gIAo+PiArICAgIHN3aXRjaCAob3B0X3hwdGkpCj4gCj4gU3R5bGUuCj4gCj4+ICsgICAgewo+
PiArICAgIGNhc2UgWFBUSV9PRkY6Cj4+ICsgICAgICAgIGQtPmFyY2gucHZfZG9tYWluLnhwdGkg
PSBmYWxzZTsKPj4gKyAgICAgICAgYnJlYWs7Cj4+ICsgICAgY2FzZSBYUFRJX09OOgo+PiArICAg
ICAgICBkLT5hcmNoLnB2X2RvbWFpbi54cHRpID0gdHJ1ZTsKPj4gKyAgICAgICAgYnJlYWs7Cj4+
ICsgICAgY2FzZSBYUFRJX05PRE9NMDoKPj4gKyAgICAgICAgZC0+YXJjaC5wdl9kb21haW4ueHB0
aSA9IGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0FNRCAmJgo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkICE9IDAgJiYKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCAhPSBoYXJkd2FyZV9k
b21pZDsKPj4gKyAgICAgICAgYnJlYWs7Cj4+ICsgICAgY2FzZSBYUFRJX0RFRkFVTFQ6Cj4+ICsg
ICAgICAgIGQtPmFyY2gucHZfZG9tYWluLnhwdGkgPSBib290X2NwdV9kYXRhLng4Nl92ZW5kb3Ig
IT0gWDg2X1ZFTkRPUl9BTUQ7Cj4+ICsgICAgICAgIGJyZWFrOwo+PiArICAgIH0KPiAKPiBXaHkg
ZG9lcyBhIDMyLWJpdCBkb21haW4gbmVlZCB0aGlzPwoKSXQgZG9lc24ndC4gSW4gbXkgY3VycmVu
dCB2ZXJzaW9uIEkgaGF2ZSBtb3ZlZCB0aGlzIGluaXRpYWxpemF0aW9uIGFuZAppdCB3aWxsIG5l
dmVyIHJ1biBmb3IgMzIgYml0IGRvbWFpbnMuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
