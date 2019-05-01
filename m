From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 07:58:05 -0600
Message-ID: <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLpl1-0000FO-Id
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 13:58:47 +0000
Received: by mail-wm1-f49.google.com with SMTP id b188so1393953wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 06:58:43 -0700 (PDT)
In-Reply-To: <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiA+IEl0IG1pZ2h0IGJlIHdvcnRoIGludHJvZHVjaW5nIGEgInN5bmMgc3RhdGUgZnJvbSBodyIg
aG9vayB3aGljaCBjb2xsZWN0cwo+ID4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRv
IHRoZSBpbnRyb3NwZWN0aW9uIGFnZW50Lgo+Cj4gWW91IG1lYW4gYWRkaW5nIGFub3RoZXIgaHZt
IGhvb2s/CgpBY3R1YWxseSwgaW5zdGVhZCBvZiBhbm90aGVyIGhvb2sgSSB0aGluayB3aGF0IHdv
dWxkIG1ha2Ugc2Vuc2UgaXQgdG8KanVzdCB1cGRhdGUgdm14X3NhdmVfdm1jc19jdHh0IHRvIGF1
dG9tYXRpY2FsbHkgcmVmcmVzaCB0aGUgY2FjaGVkCnJlZ2lzdGVyIHZhbHVlcyB3aGVuIGl0J3Mg
Y2FsbGVkIHdpdGggInYgPT0gY3VycmVudCIuIFRob3VnaHRzPwoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
