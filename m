From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] xen: fixes for 4.20-rc1
Date: Tue, 30 Oct 2018 09:32:46 -0700
Message-ID: <CAHk-=wgiWPqTxQuND8zVpYe7gEKhnZnPtd02up4i7C_tDVPrdA__34187.4796119102$1540917112$gmane$org@mail.gmail.com>
References: <20181030074420.17905-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lq7b=nk=linuxfoundation.org=torvalds@srs-us1.protection.inumbo.net>)
 id 1gHWx1-0005F7-Cn
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:33:07 +0000
Received: by mail-lj1-x244.google.com with SMTP id s15-v6so12017860lji.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 09:33:06 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id q69sm1011653lfg.1.2018.10.30.09.33.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 09:33:03 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id g26-v6so10727722lja.10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 09:33:02 -0700 (PDT)
In-Reply-To: <20181030074420.17905-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMTI6NDQgQU0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPgo+IEl0IGNvbnRhaW5zIG9ubHkgc2V2ZXJhbCBzbWFsbCBmaXhlcyBh
bmQgY2xlYW51cHMgdGhpcyB0aW1lLgoKUHVsbGVkLAoKICAgICAgICAgICAgICAgICAgICAgTGlu
dXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
