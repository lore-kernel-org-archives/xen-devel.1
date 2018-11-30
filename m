From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 6/6] x86/microcode: Synchronize late
 microcode loading
Date: Fri, 30 Nov 2018 02:46:35 -0700
Message-ID: <5C0106FB020000780020182A@prv1-mh.provo.novell.com>
References: <1543383256-12371-1-git-send-email-chao.gao@intel.com>
 <1543383256-12371-7-git-send-email-chao.gao@intel.com>
 <20181128152209.hqpgqtuy2mx7ytk6@mac> <20181129044325.GD23701@gao-cwp>
 <20181129095653.d2jwozb7xbuq6cq2@mac>
 <d02e8e5a-369a-6509-94f4-6e0e1872b118@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSfPb-0005VQ-Cz
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 09:48:39 +0000
In-Reply-To: <d02e8e5a-369a-6509-94f4-6e0e1872b118@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Borislav Petkov <bp@suse.de>, Wei Liu <wei.liu2@citrix.com>, Ashok Raj <ashok.raj@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Roger Pau Monne <roger.pau@citrix.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjExLjE4IGF0IDIzOjQzLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uZSBvdGhlciBjb21tZW50IGFib3V0IHRoaXMgcGF0Y2ggKHdoaWNoIElJUkMgd2Fz
IHJhaXNlZCBieSBBbmRyZXcgb24KPiBhbiBlYXJsaWVyIHZlcnNpb24pIGlzIHRoYXQgaXQgbWF5
IGJlIHdvcnRoIHRvIHN0b3AgdGltZXIgY2FsaWJyYXRpb24uIEkKPiBhbSBwcmV0dHkgc3VyZSB3
ZSd2ZSBzZWVuIGRlYWRsb2Nrcywgd2hpY2ggaXMgd2h5IHdlIGVuZGVkIHVwIGRpc2FibGluZwo+
IGl0IGR1cmluZyBtaWNyb2NvZGUgdXBkYXRlcy4KCkkgcmVjYWxsIHRoZSBjbGFpbSwgYnV0IEkg
ZG9uJ3QgdGhpbmsgSSd2ZSBldmVyIHNlZW4gcHJvb2YuIE15IHBvaW50IHdhcwphbnMgc3RpbGwg
aXMgdGhhdCBpZiB0aGVyZSdzIGEgcHJvYmxlbSB3aXRoIHVjb2RlIGxvYWRpbmcgdXNpbmcgdGhl
CnN0b3AtbWFjaGluZSBsb2dpYyBoZXJlLCB0aGVuIHRoZXJlJ3MgYSBwcm9ibGVtIHdpdGggdGhl
IHN0b3AtbWFjaGluZQpsb2dpYyBpbiBnZW5lcmFsLCB3aGljaCB3b3VsZCBtYWtlIG90aGVyIHVz
ZXMsIHBlcmhhcHMgbW9zdCBub3RhYmx5CnJjdV9iYXJyaWVyKCksIHVuc2FmZSB0b28uIE90b2gg
ZnJvbSB5b3VyIHJlcGx5IGl0J3Mgbm90IGNsZWFyIHdoZXRoZXIKdGhlIG9ic2VydmVkIGlzc3Vl
IHdhc24ndCB3aXRoIG91ciBwcmVzZW50IHdheSBvZiBsb2FkaW5nIHVjb2RlLApidXQgdGhlbiBp
dCB3b3VsZCBwdXQgdW5kZXIgcXVlc3Rpb24gdGhlIGdlbmVyYWwgY29ycmVjdG5lc3Mgb2YKY29u
dGludWVfaHlwZXJjYWxsX29uX2NwdSgpLCB3aGljaCBhZ2FpbiB3ZSB1c2UgZm9yIG1vcmUgdGhh
biBqdXN0CnVjb2RlIGxvYWRpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
