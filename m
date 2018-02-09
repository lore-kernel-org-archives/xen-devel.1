From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] xen: fixes for 4.16 rc1
Date: Fri, 9 Feb 2018 10:48:40 -0800
Message-ID: <CA+55aFxyEpQUgpZtkRbc1ESbMBw6FcbLgbzB3ioPN_097HpzOg__39619.469914078$1518202074$gmane$org@mail.gmail.com>
References: <20180209142800.25485-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=16jq=fd=gmail.com=linus971@srs-us1.protection.inumbo.net>)
 id 1ekDj1-0005iL-4J
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 18:48:43 +0000
Received: by mail-io0-x236.google.com with SMTP id g14so4501905iob.9
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 10:48:42 -0800 (PST)
In-Reply-To: <20180209142800.25485-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgOSwgMjAxOCBhdCA2OjI4IEFNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC94ZW4vdGlwLmdpdCBmb3ItbGludXMtNC4xNi1yYzEtdGFnCgpTbyBJJ3ZlIHB1bGxl
ZCB0aGlzLCBidXQgdGhlIGJhY2stbWVyZ2VzICpyZWFsbHkqIGFubm95IG1lLgoKU2VyaW91c2x5
LCBET04nVCBETyBNRVJHRVMgSUYgWU9VIENBTk5PVCBFVkVOIEJFIEJPVEhFUkVEIFRPIFdSSVRF
IEEKUkVBU09OIEZPUiBUSEVNIQoKVGhlcmUgYXJlIHR3byBiYWNrLW1lcmdlcyBpbiB0aGF0IHRy
ZWUsIGFuZCB3aGlsZSB0aGV5IGJvdGggbWVyZ2UKcmVhc29uYWJsZSBtZXJnZSBwb2ludHMgKHY0
LjE0IGFuZCB2NC4xNSByZXNwZWN0aXZlbHkpLCBuZWl0aGVyIG9mCnRoZW0gaGFzICphbnkqIGV4
cGxhbmF0aW9uIG9mIHdoeSB0aGUgZipjayB0aGUgbWVyZ2Ugd2FzIGRvbmUuIFRoZQp2NC4xNSBt
ZXJnZSBkb2Vzbid0IGV2ZW4gbWFrZSBpdCBjbGVhciB0aGF0IGl0IG1lcmdlcyB2NC4xNSAtIGl0
IGp1c3QKc2F5cyAibWFzdGVyIi4KCkhhdmluZyByYW5kb20gY29tbWl0cyB3aXRoIG5vIGV4cGxh
bmF0aW9uIG9mIHdoYXQgdGhlIGhlbGwgdGhleSBhcmUKZG9pbmcgaXMgTk9UIE9LLiBJdCdzIG5v
dCBvayB3aGVuIHRoZXkgZG8gcmVhbCBjaGFuZ2VzLCBidXQgaXQncyBFVkVOCk1PUkUgbm90IG9r
IHdoZW4gdGhleSBhcmUganVzdCByYW5kb20gbWVyZ2VzIHRoYXQgYnJpbmcgaW4Kd2hvLXRoZS1o
ZWxsLWtub3dzLXdoYXQuCgpNZXJnZSBjb21taXRzIG5lZWQgZXhwbGFuYXRpb25zIG9mIHdoYXQg
dGhleSBtZXJnZSBhbmQgd2h5IHRoZXkgbWVyZ2UgaXQuIFRoaXM6CgogICAgTWVyZ2UgYnJhbmNo
ICdtYXN0ZXInIG9mCnNzaDovL2dpdG9saXRlLmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Cgood2hpY2ggaXMgYWxsIHRoZSBleHBsYW5hdGlvbiB0aGVy
ZSBpcyBpbiBjb21taXQgZGRiOWUxM2FmM2JiKSBpcwpzaW1wbHkgbm90IGFjY2VwdGFibGUuCgpB
dCBsZWFzdCB0aGUgb3RoZXIgbWVyZ2UgbWVyZ2VkIHRoZSB2NC4xNCBfdGFnXywgc28ganVzdCBs
b29raW5nIGF0CnRoZSBtZXJnZSBpdCdzIGF0IGxlYXN0IGNsZWFyIHRoYXQgeW91IG1lcmdlZCBh
IHJlYWwgcmVsZWFzZS4gSXQgc3RpbGwKZG9lc24ndCBleHBsYWluIF93aHlfIGl0IHdhcyBtZXJn
ZWQuCgpJZiB5b3UgY2Fubm90IHN0YXRlIGEgZ29vZCByZWFzb24gZm9yIHRoZSBtZXJnZSwgb3Ig
eW91IGNhbid0IGJlCmJvdGhlcmVkIHRvIHdyaXRlIG9uZSwgRE8gTk9UIERPIFRIRSBNRVJHRS4K
Ckl0J3MgcmVhbGx5IHRoYXQgc2ltcGxlLgoKICAgICAgICAgIExpbnVzICJncnVtYmxlIiBUb3J2
YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
