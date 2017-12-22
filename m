From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [RFC v1] ALSA: xen-front: Add Xen para-virtualized
 frontend driver
Date: Fri, 22 Dec 2017 18:07:15 +0200
Message-ID: <546442fa-38b7-6577-56f7-273be9799c1b__32095.9423239858$1513958788$gmane$org@epam.com>
References: <fff5d166-066c-c21e-94b9-bb50f8c1b2cd@epam.com>
 <172d2f40-937d-5455-1b4e-576ac7b0da45@gmail.com>
 <9031a8b0-88c2-bd86-548c-7dbcf8967856@gmail.com>
 <20171222151221.GC2483@char.us.oracle.com>
 <d3b93842-a970-e2e0-2ecb-6f66c2851f6c@epam.com>
 <20171222155817.GH2483@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=964v=ds=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1eSPr8-0005ej-Ce
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2017 16:07:30 +0000
In-Reply-To: <20171222155817.GH2483@char.us.oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: alsa-devel@alsa-project.org, Oleksandr Andrushchenko <andr2000@gmail.com>, Clemens Ladisch <clemens@ladisch.de>, tiwai@suse.com, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8yMi8yMDE3IDA1OjU4IFBNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6Cj4g
T24gRnJpLCBEZWMgMjIsIDIwMTcgYXQgMDU6NDg6NDVQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4+IE9uIDEyLzIyLzIwMTcgMDU6MTIgUE0sIEtvbnJhZCBSemVzenV0
ZWsgV2lsayB3cm90ZToKPj4+IE9uIE1vbiwgRGVjIDExLCAyMDE3IGF0IDEwOjQ1OjI3QU0gKzAy
MDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+Pj4+IHBpbmcKPj4+IC4uc25pcC4u
Cj4+Pj4+PiBUaGlzIGlzIGltcGxlbWVudGVkIGFzIGEgY2hhbmdlIHRvIHRoZSBzbmRpZiBwcm90
b2NvbCBbOF0gYW5kIGFsbG93cwo+Pj4+Pj4gWzhdIGh0dHBzOi8vZ2l0aHViLmNvbS9hbmRyMjAw
MC9saW51eC9jb21taXQvMDk1ZDdmZWFlMDBiZjAwYzg1MmM2N2M0ZjEwNDRkZTU2MDE2NzhlZAo+
Pj4gLi4gSSBtdXN0IGhhdmUgbWlzc2VkIGl0IGJlaW5nIHBvc3RlZC4KPj4+Cj4+PiBCdXQgaXQg
bG9va3MgT0sgdG8gbWUgLSBjb3VsZCB5b3UgcmVwb3N0IGl0IGFuZCBwbGVhc2UgaGF2ZSBtZSBv
biBUbzogbGlzdD8KPj4+Cj4+IERpZCBJIGdldCB5b3UgcmlnaHQgdGhhdCB5b3Ugd2FudCBtZSB0
byByZXBvc3QgdGhlIFJGQyBhZ2Fpbj8KPiBZZXMgcGxzLCBidXQgcGxzIHNraXAgdGhlIFJGQyBw
YXJ0IG9mIHRoZSBwYXRjaC4gSnVzdCBhcyB2MSBwbGVhc2UuCkFoLCB3ZWxsLCBJIGFtIG5vdCBx
dWl0ZSBzdXJlIHRoaXMgaXMgdGhlIHJpZ2h0IHRpbWUgdG8gZGlzY3VzcyB0aGUgY2hhbmdlcwpp
biB0ZXJtcyBvZiBwYXRjaGVzOiBJIHdvdWxkIGxpa2UgdG8gZGlzY3VzcyB0aGUgaWRlYSBmaXJz
dCwgZS5nLgppZiB0aGUgYXBwcm9hY2ggaXRzZWxmIGlzIGFjY2VwdGFibGUgYnkgdGhlIEFMU0Eg
Y29tbXVuaXR5IGFuZCBpZiBpdCBpcywKdGhlbiBJJ2xsIHB1c2ggdjEsIGUuZyBtb3ZlIHRvIHBh
dGNoZXMgc3RhZ2UuIEhlbmNlLCBoZXJlIGlzIHRoZSBSRkMuLi4KClRoZSBkcml2ZXIgaXRzZWxm
IChhdCB0aGUgbW9tZW50KSBpcyBqdXN0IGEgcHJvb2Ytb2YtY29uY2VwdCBmb3IgdGhlCmNvbW11
bml0eSB0byBzaG93IHRoYXQgdGhlIGFwcHJvYWNoIHdlIGFyZSBvZmZlcmluZyBpbiB0aGUgUkZD
IGFjdHVhbGx5IAp3b3Jrcy4KCkRvZXMgdGhlIGFib3ZlIG1ha2Ugc2Vuc2U/CgpUaGFuayB5b3Us
Ck9sZWtzYW5kcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
