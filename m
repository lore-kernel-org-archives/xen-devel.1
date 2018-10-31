From: Christian Lindig <christian.lindig@citrix.com>
Subject: [PATCH v2 1/1] tools/ocaml: Re-introduce
 Xenctrl.with_intf wrapper
Date: Wed, 31 Oct 2018 11:33:22 +0000
Message-ID: <20181031113323.22379-1-christian.lindig@citrix.com>
References: <26EDCEB0-FF2A-42A2-B538-56B8C0124A10@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yun1=nl=citrix.com=prvs=8358bb395=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1gHol9-0008FZ-4K
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 11:34:03 +0000
In-Reply-To: <26EDCEB0-FF2A-42A2-B538-56B8C0124A10@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBpIHVwZGF0ZWQ6CgoqIHNldCB0aGUgZ2xvYmFsIGhhbmRsZSB0byBOb25lCiog
dXBkYXRlZCBkb2N1bWVudGF0aW9uCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
