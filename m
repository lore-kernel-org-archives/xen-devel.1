From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 5.0 regression: BUG: unable to handle kernel
 paging request at ffff888023e26778
Date: Sat, 9 Feb 2019 10:54:27 -0800
Message-ID: <CAHk-=winXFRv0KUa332spZx0yaDKMAbdKSeAcBATtacACLgm0A__34269.642718003$1549738548$gmane$org@mail.gmail.com>
References: <39ae9195-cf8f-01fe-df83-38a9a4c52e48@eikelenboom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6yXJ=QQ=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gsXm4-0008S0-3a
 for xen-devel@lists.xenproject.org; Sat, 09 Feb 2019 18:54:48 +0000
Received: by mail-lj1-x243.google.com with SMTP id c19-v6so5679786lja.5
 for <xen-devel@lists.xenproject.org>; Sat, 09 Feb 2019 10:54:46 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id t9-v6sm1151248ljj.87.2019.02.09.10.54.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 09 Feb 2019 10:54:43 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id x25-v6so2042735ljj.13
 for <xen-devel@lists.xenproject.org>; Sat, 09 Feb 2019 10:54:43 -0800 (PST)
In-Reply-To: <39ae9195-cf8f-01fe-df83-38a9a4c52e48@eikelenboom.it>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sander Eikelenboom <linux@eikelenboom.it>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill@shutemov.name>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBGZWIgOSwgMjAxOSBhdCAxMjoyNCBBTSBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4
QGVpa2VsZW5ib29tLml0PiB3cm90ZToKPgo+IEkgaGF2ZW4ndCBnb3QgYSByZXByb2R1Y2VyIHNv
IGkgbWlnaHQgYmUgaGFyZCB0byBoaXQgaXQgYWdhaW4sCj4gc3lzdGVtIGlzIEFNRCBhbmQgdGhp
cyBpcyBmcm9tIHRoZSBob3N0IGtlcm5lbCBydW5uaW5nIHVuZGVyCj4gdGhlIFhlbiBoeXBlcnZp
c29yIG1pZ2h0IGl0IG1hdHRlci4KCkkgdGhpbmsgdGhpcyBpcyBhIFhlbiBidWcuCgpJbiBwYXJ0
aWN1bGFyLCB0aGVyZSdzIGEgZmV3IHBvaXNvbiB2YWx1ZXMgaW4gdGhlcmUgdGhhdCBsb29rIGxp
a2UKemVuLiBMaWtlIHRoaXM6CgogICBSMTA6IGRlYWRiZWVmZGVhZGYwMGQKCmxvb2tzIGxpa2Ug
YSBzcGVjaWFsIHBvaXNvbiB2YWx1ZSB0aGF0IGlzIGZyb20gWGVuIGl0c2VsZi4KCkl0IGxvb2tz
IGxpa2UgdGhlIG9vcHMgaXMgYXJvdW5kIHRoZSBUTEIgZmx1c2hpbmcgY29kZSwgbG9va2luZyBh
dCB0aGUKY29kZSBpdCdzIHRoZQoKICAgICAgICBhcmNoX2xlYXZlX2xhenlfbW11X21vZGUoKTsK
ICAgICAgICBpZiAoZm9yY2VfZmx1c2gpCiAgICAgICAgICAgICAgICBmbHVzaF90bGJfcmFuZ2Uo
dm1hLCBvbGRfZW5kIC0gbGVuLCBvbGRfZW5kKTsKICAgICAgICBpZiAobmV3X3B0bCAhPSBvbGRf
cHRsKQogICAgICAgICAgICAgICAgc3Bpbl91bmxvY2sobmV3X3B0bCk7CgpzZXF1ZW5jZSBpbiBt
b3ZlX3BhZ2VfdGFibGVzLiBUaGUgb29wc2luZyBjb2RlIHNlcXVlbmNlIGlzCgoKICAyODoqIDQ4
IDg5IDQ1IDAwICAgICAgICAgIG1vdiAgICAlcmF4LDB4MCglcmJwKSA8LS0gdHJhcHBpbmcgaW5z
dHJ1Y3Rpb24KICAyYzogNDEgZjYgNDYgNTIgNDAgICAgICAgIHRlc3RiICAkMHg0MCwweDUyKCVy
MTQpCgphbmQgdGhhdCAidGVzdGIgJDB4NDAiIGluc3RydWN0aW9uIHRoYXQgY29tZXMgYWZ0ZXIg
dGhlIHRyYXBwaW5nCmluc3RydWN0aW9uIGlzIHRoZQoKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKCh2bWEpLT52bV9mbGFncyAmIFZNX0hVR0VUTEIpICAgICAgICAgICAgICAgXAoKZnJvbSB0
aGUgZmx1c2hfdGxiX3JhbmdlKCkgbWFjcm86CgojZGVmaW5lIGZsdXNoX3RsYl9yYW5nZSh2bWEs
IHN0YXJ0LCBlbmQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgZmx1
c2hfdGxiX21tX3JhbmdlKCh2bWEpLT52bV9tbSwgc3RhcnQsIGVuZCwgICAgICAgICAgICAgICAg
ICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgKCh2bWEpLT52bV9mbGFncyAmIFZNX0hV
R0VUTEIpICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8g
aHVnZV9wYWdlX3NoaWZ0KGhzdGF0ZV92bWEodm1hKSkgICAgICBcCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgOiBQQUdFX1NISUZULCBmYWxzZSkKCmlmIEkgcmVhZCB0aGF0IG9vcHMg
Y29ycmVjdGx5LgoKSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGF0IHN0b3JlIHRvIDAoJXJicCkgaXMg
Zm9yLCB0aG91Z2ggLSBJIGNhbid0CmxpbmUgdGhhdCB1cCB3aXRoIGFueXRoaW5nIEkgc2VlIHdp
dGggbXkgb3duIGtlcm5lbCBjb25maWcuCgpXZSAqZG8qIGhhdmUgY2hhbmdlcyB0byA1LjAgaW4g
dGhlIG1vdmVfcGFnZV90YWJsZXMoKSBjb2RlIChtcmVtYXAgb24KYSBwbWQgbGV2ZWwpLCBzbyBJ
J20gY2MnaW5nIHNvbWUgb2YgdGhlIHBlb3BsZSBpbnZvbHZlZCB0aGVyZSwgYnV0CnRoYXQgb2Rk
IHBvaXNvbiB2YWx1ZSBkb2VzIG1ha2UgbWUgd29uZGVyIGFidXQgWGVuIGlzc3Vlcy4gV2hlbiBJ
Cmdvb2dsZSBmb3IgdGhhdCB2YWx1ZSwgYWxsIEkgc2VlIGlzIFhlbiByZXBvcnRzIChhbmQgeW91
ciByZXBvcnQgZm9yCnRoaXMpLgoKICAgICAgICAgICAgICAgICAgICBMaW51cwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
