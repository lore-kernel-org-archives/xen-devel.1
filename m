From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [BUG] kernel bug encountered at
 drivers/net/xen-netback/netback.c:430!
Date: Wed, 10 Jan 2018 12:52:10 +0000
Message-ID: <1fa2f53623a946e2b4ee2fc0b3632360@AMSPEX02CL03.citrite.net>
References: <5a3ca8ee.4426620a.b956d.1799@mx.google.com>
 <352b0317-cfc5-1ef4-fbd0-2b2879f9712e@suse.com>
 <5a3d6c93.886f620a.2522d.c2fb@mx.google.com>
 <23eb0f3f-590d-f03a-f971-65e86c52fbe4@ark-net.org>
 <5a4546b1.55da620a.5c435.4b4b@mx.google.com>
 <3f860d32831940e7aa40d97979155b6e@AMSPEX02CL03.citrite.net>
 <20180103203337.GA79570@elch.exwg.net>
 <3104994914c94a26baed6195f486c03f@AMSPEX02CL03.citrite.net>
 <20180107221904.GA78680@elch.exwg.net>
 <6f58d8db2c3a40248c447ff8f7f57067@AMSPEX02CL03.citrite.net>
 <ef22c8e42fc7441587dccba1e0729495@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mzcr=ef=citrix.com=prvs=5411c3939=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1eZFrf-0003MQ-CF
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 12:52:19 +0000
In-Reply-To: <ef22c8e42fc7441587dccba1e0729495@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Christoph Moench-Tegeder' <cmt@burggraben.net>
Cc: 'Michael Collins' <mike@ark-net.org>, 'Juergen Gross' <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, 'Alex Braunegg' <alex.braunegg@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SSBoYXZlIHRyYWNrZWQgZG93biB0aGUgcHJvYmxlbSB0byBtdWx0aXBsZSBjYWxscyB0byB0aGUg
emVyb2NvcHkgY2FsbGJhY2sgZm9yIHRoZSBzYW1lIHVidWZfaW5mby4gSSBhbSBub3Qgc3VyZSBl
eGFjdGx5IHdoaWNoIHBhdGNoIGludHJvZHVjZWQgdGhlIGlzc3VlIGJ1dCBteSBzdXNwaWNpb24g
aXMgdGhhdCBpdCB3YXMgb25lIG9mIHRoZSB0aGUgTVNHX1pFUk9DT1BZIHNlcmllcyAoc2VlIGh0
dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LW5ldGRldiZtPTE0OTgwNzk5NzcyNjczMyZ3PTIpLg0K
SSBoYXZlIGEgY2FuZGlkYXRlIHBhdGNoIHRvIG5ldGJhY2sgdG8gbWFrZSB1c2Ugb2YgdGhlIHVi
dWZfaW5mbyByZWYgY291bnQgdG8gaGFuZGxlIHRoZSBtdWx0aXBsZSBjYWxsYmFja3MgYW5kIHRo
YXQgY2VydGFpbmx5IGZpeGVzIHRoZSBpc3N1ZSBmb3IgbWUuIEknbGwgcG9zdCB0aGlzIHNob3J0
bHkgcmVjb21tZW5kaW5nIGEgYmFja3BvcnQgdG8gc3RhYmxlLg0KDQogIFBhdWwNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
