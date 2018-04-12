From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 0/5] for-linux/sndif: add explicit back and
 front synchronization
Date: Thu, 12 Apr 2018 20:13:02 +0300
Message-ID: <eb882793-4024-7299-9d34-62d3cf462a33__5195.86361847377$1523553107$gmane$org@gmail.com>
References: <20180412160102.15833-1-oleksandr_andrushchenko@epam.com>
 <d5ede3f5-200e-f1c7-71f4-4ebfb938ca48@gmail.com>
 <43348cf5-d2f8-9d7d-0390-2273eef8f67d@oracle.com>
 <db3ee9fb-d0ab-5f17-a1ec-7bb8ec5cf75f@epam.com>
 <690a322e-20a6-fe55-1d87-0a52de126ee0@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zar1=hb=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f6fmX-0007xd-4a
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 17:13:09 +0000
Received: by mail-lf0-x244.google.com with SMTP id q5-v6so8763398lff.12
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 10:13:07 -0700 (PDT)
In-Reply-To: <690a322e-20a6-fe55-1d87-0a52de126ee0@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, konrad.wilk@oracle.com, tiwai@suse.de
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTIvMjAxOCAwODoxMyBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDA0LzEy
LzIwMTggMTI6NTUgUE0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwNC8x
Mi8yMDE4IDA3OjU1IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwNC8xMi8yMDE4
IDEyOjExIFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiBIZWxsbywgS29u
cmFkLCBUYWthc2hpIQo+Pj4+Cj4+Pj4gQ291bGQgeW91IHBsZWFzZSByZXZpZXcgdGhlICpMaW51
eCBLZXJuZWwqIHZlcnNpb24gb2YgdGhlIGNoYW5nZXM/Cj4+Pj4gQXMgSSBzYWlkIGluIHRoZSBj
b3ZlciBsZXR0ZXIgYmVsb3cgdGhlcmUgaXMgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzCj4+Pj4gY29t
cGFyaW5nIHRvIHRoZSBjb3JyZXNwb25kaW5nIFhlbiB2ZXJzaW9uLCBidXQgc3BhY2VzIHRvIHRh
YnMuCj4+Pj4gU3RpbGwsIGZvcm1hbGx5LCBJIGhhdmUgdG8gZHJvcCB0aGUgUi1iIHRhZ3MgYW5k
IHJlcXVlc3QgZm9yIHRoZSBuZXcKPj4+PiByZXZpZXcuCj4+PiBJcyB0aGVyZSBhbnkgcmVhc29u
IHdoeSB0aGlzIGFsbCBjYW4ndCBiZSBkb25lIGluIGEgc2luZ2xlIHBhdGNoPwo+PiBKdXN0IHRv
IHByZXNlcnZlIHRoZSBoaXN0b3J5IG9mIHRoZSBjaGFuZ2VzPwo+IFRoZSBoaXN0b3J5IGlzIHRy
YWNrZWQgaW4gWGVuIHRyZWUgYW5kIHNpbmNlIHlvdSBhcmUgb25seSB1cGRhdGluZyB0aGUKPiBo
ZWFkZXIgZmlsZSBJIGRvbid0IHRoaW5rIHdlIGdhaW4gbXVjaCBieSByZXBlYXRpbmcgaXQgaGVy
ZS4KbWFrZXMgc2Vuc2UKPj4+IFRoaXMgaXMganVzdCBzeW5jaW5nIHVwIHdpdGggdGhlIGNhbm9u
aWNhbCBkZWZpbml0aW9uIGluIFhlbi4KPj4gRG8geW91IHdhbnQgbWUgdG8gc3F1YXNoIGFuZCBy
ZXNlbmQ/Cj4KPiBZZXMsIHBsZWFzZS4Kd2lsbCBkbwo+IC1ib3JpcwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
