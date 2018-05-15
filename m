From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 4/6] ALSA: xen-front: Implement handling
 of shared buffers
Date: Tue, 15 May 2018 09:02:08 +0300
Message-ID: <19a2c003-6730-265a-29aa-1eedd37147b9__15392.7111220129$1526364071$gmane$org@epam.com>
References: <20180514062742.25879-1-andr2000@gmail.com>
 <20180514062742.25879-5-andr2000@gmail.com> <s5ho9hi56ds.wl-tiwai@suse.de>
 <e37b5170-4fab-0c06-8902-730e57118ceb@gmail.com>
 <s5h8t8l5ufq.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yhxq=ic=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1fIT2X-0007Hw-7X
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 06:02:25 +0000
In-Reply-To: <s5h8t8l5ufq.wl-tiwai@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Takashi Iwai <tiwai@suse.de>, Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTUvMjAxOCAwOTowMSBBTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIFR1ZSwgMTUg
TWF5IDIwMTggMDc6NDY6MzggKzAyMDAsCj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4+IE9uIDA1LzE0LzIwMTggMTE6MjggUE0sIFRha2FzaGkgSXdhaSB3cm90ZToKPj4+IE9uIE1v
biwgMTQgTWF5IDIwMTggMDg6Mjc6NDAgKzAyMDAsCj4+PiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToKPj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4gKysrIGIvc291bmQveGVuL3hlbl9zbmRf
ZnJvbnRfc2hidWYuYwo+Pj4+IEBAIC0wLDAgKzEsMTkzIEBACj4+Pj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wIE9SIE1JVAo+Pj4+ICsKPj4+PiArLyoKPj4+PiArICogWGVu
IHBhcmEtdmlydHVhbCBzb3VuZCBkZXZpY2UKPj4+PiArICoKPj4+PiArICogQ29weXJpZ2h0IChD
KSAyMDE2LTIwMTggRVBBTSBTeXN0ZW1zIEluYy4KPj4+PiArICoKPj4+PiArICogQXV0aG9yOiBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
Cj4+Pj4gKyAqLwo+Pj4+ICsKPj4+PiArI2luY2x1ZGUgPHhlbi94ZW4uaD4KPj4+PiArI2luY2x1
ZGUgPHhlbi94ZW5idXMuaD4KPj4+PiArCj4+Pj4gKyNpbmNsdWRlICJ4ZW5fc25kX2Zyb250X3No
YnVmLmgiCj4+PiBIbSwgd2l0aCB0aGUgbG9jYWwgYnVpbGQgdGVzdCwgSSBnZXQgdGhlIGZvbGxv
d2luZyBlcnJvcjoKPj4+Cj4+PiAgICAgQ0MgW01dICBzb3VuZC94ZW4veGVuX3NuZF9mcm9udF9z
aGJ1Zi5vCj4+PiAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHNvdW5kL3hlbi94ZW5fc25kX2Zy
b250X3NoYnVmLmM6MTE6MDoKPj4+ICAgICAuL2luY2x1ZGUveGVuL3hlbi5oOjE4Ojg6IGVycm9y
OiB1bmtub3duIHR5cGUgbmFtZSDigJhib29s4oCZCj4+PiAgICAgIGV4dGVybiBib29sIHhlbl9w
dmg7Cj4+PiAgICAgICAgICAgICAgXn5+fgo+Pj4gICAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
Li9pbmNsdWRlL3hlbi9pbnRlcmZhY2UveGVuLmg6MzA6MCwKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICBmcm9tIC4vaW5jbHVkZS94ZW4veGVuLmg6MjksCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgZnJvbSBzb3VuZC94ZW4veGVuX3NuZF9mcm9udF9zaGJ1Zi5jOjExOgo+Pj4gICAgIC4vYXJj
aC94ODYvaW5jbHVkZS9hc20veGVuL2ludGVyZmFjZS5oOjkyOjIxOiBlcnJvcjogdW5rbm93biB0
eXBlIG5hbWUg4oCYdWludDY0X3TigJkKPj4+ICAgICAgREVGSU5FX0dVRVNUX0hBTkRMRSh1aW50
NjRfdCk7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+Pj4gCQkJCj4+PiBBZGRpbmcg
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPiBmaXhlZCB0aGUgaXNzdWUuCj4+Pgo+Pj4gRGlkIHlv
dSByZWFsbHkgdGVzdCB5b3VyIHBhdGNoZXMgd2l0aCB0aGUgbGF0ZXN0IExpbnVzIHRyZWU/Cj4+
IE15IGJhZCwgaXQgZG9lcyBidWlsZCBmb3IgQVJNICh3aGljaCBpcyBteSB0YXJnZXQpLCBidXQg
YWxzbyBkb2VzCj4+IG5lZWQgIiNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4iIGZvciB4ODYgd2hp
Y2ggSSBkaWRuJ3QgYnVpbGQgdGhpcyB0aW1lLgo+PiBTb3JyeSBhYm91dCB0aGF0Lgo+Pgo+PiBE
byB5b3Ugd2FudCBtZSB0byByZXNlbmQgdGhpcyBzaW5nbGUgcGF0Y2ggb3IgeW91IGNhbiBtYWtl
IHRoZSBjaGFuZ2UKPj4gd2hpbGUgYXBwbHlpbmc/Cj4gWWVzLCBpdCdzIGZpbmUuClRoYW5rIHlv
dQo+Cj4gdGhhbmtzLAo+Cj4gVGFrYXNoaQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
