From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Tue, 12 Feb 2019 20:19:50 +0200
Message-ID: <213b69fe-380f-e354-b828-4864555e145f@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
 <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
 <CABfawhn=Yjbd_r_NZRdkKX9SGQHbKYHuW8GmkLgrPehp5WA5HA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8704=QT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gtcfG-0001kp-BP
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 18:20:14 +0000
In-Reply-To: <CABfawhn=Yjbd_r_NZRdkKX9SGQHbKYHuW8GmkLgrPehp5WA5HA@mail.gmail.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSA4OjEzIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVHVlLCBKYW4g
OCwgMjAxOSBhdCA5OjM5IEFNIFJhenZhbiBDb2pvY2FydQo+IDxyY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tPiB3cm90ZToKPj4KPj4gT24gMS84LzE5IDY6MjcgUE0sIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+Pj4gT24gMTkuMTIuMTggYXQgMTk6NTIsIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4gd3JvdGU6Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1
QGJpdGRlZmVuZGVyLmNvbT4KPj4+Cj4+PiBBbiBlbXB0eSBkZXNjcmlwdGlvbiBpcyBub3QgaGVs
cGZ1bC4gVGhlIGltbWVkaWF0ZSBxdWVzdGlvbiBpczogV2h5Pwo+Pj4gV2UgZG9uJ3QgZG8gdGhp
cyBmb3Igb3RoZXIgaW50ZXJmYWNlIHZlcnNpb25zLiBJJ20gdW5jb252aW5jZWQgYQo+Pj4gc3Bl
Y2lhbCBwdXJwb3NlIHBpZWNlIG9mIGluZm9ybWF0aW9uIGxpa2UgdGhpcyBvbmUgYmVsb25ncyBp
bnRvIHRoZQo+Pj4gcmF0aGVyIGdlbmVyaWMgdmVyc2lvbiBoeXBlcmNhbGwuCj4+Cj4+IEZvciBh
biBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uIG1lYW50IHRvIGJlIGRlcGxveWVkIG9uIHNldmVy
YWwgWGVuCj4+IHZlcnNpb25zIHdpdGhvdXQgcmVjb21waWxpbmcsIGl0IGlzIGltcG9ydGFudCB0
byBiZSBhYmxlIHRvIGRlY2lkZSBhdAo+PiBydW50aW1lIHdoYXQgc2l6ZSBhbmQgbGF5b3V0IHRo
ZSB2bV9ldmVudCBzdHJ1Y3QgaGFzLgo+Pgo+PiBDdXJyZW50bHkgdGhpcyBjYW4gc29tZXdoYXQg
YmUgZG9uZSBieSBhc3NvY2lhdGluZyB0aGUgY3VycmVudCB2ZXJzaW9uCj4+IHdpdGggdGhlIHZt
X2V2ZW50IHZlcnNpb24sIGJ1dCB0aGF0IGlzIG5vdCBpZGVhbCBmb3Igb2J2aW91cyByZWFzb25z
Lgo+IAo+IFdlIGRvIGV4YWN0bHkgdGhhdCBpbiBMaWJWTUkgYW5kIGl0IHdvcmtzIGZpbmUgLSBj
YXJlIHRvIGVsYWJvcmF0ZQo+IHdoYXQgcHJvYmxlbSB5b3UgaGF2ZSB3aXRoIGRvaW5nIHRoYXQ/
IFRoZXJlIGlzIGEgMToxIG1hdGNoIGJldHdlZW4KPiBhbnkgc3RhYmxlIFhlbiB2ZXJzaW9uIGFu
ZCBhIHZtX2V2ZW50IGludGVyZmFjZSB2ZXJzaW9uLiBJIGRvbid0IHRoaW5rCj4gd2Ugd2lsbCBl
dmVyIGhhdmUgYSBzaXR1YXRpb24gd2hlcmUgd2UgYnVtcCB0aGUgdm1fZXZlbnQgaW50ZXJmYWNl
Cj4gdmVyc2lvbiBidXQgbm90IHRoZSBYZW4gcmVsZWFzZSB2ZXJzaW9uLgoKWGVuU2VydmVyLiBB
bnkgZ2l2ZW4gdmVyc2lvbiBvZiBYZW5TZXJ2ZXIgbWF5IG9yIG1heSBub3QgZml0IHRoZSBtYXRy
aXgKeW91J3JlIHRhbGtpbmcgYWJvdXQgKGJlY2F1c2Ugc29tZSBwYXRjaGVzIGFyZSBiYWNrcG9y
dGVkLCBzb21lIGFyZSBub3QsCmV0Yy4pLiBJbiB3aGljaCBjYXNlIGl0IGFsbCBiZWNvbWVzIHZl
cnkgY29tcGxpY2F0ZWQuCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
