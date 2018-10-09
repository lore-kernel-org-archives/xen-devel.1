From: Jintack Lim <jintack@cs.columbia.edu>
Subject: Xen network performance degradation with a net-front
 commit
Date: Tue, 9 Oct 2018 13:15:36 -0400
Message-ID: <CAHyh4xhYKjhGBEqcDR_ukXHSDyuHxt8OjiAW5QJ-_k2Y-RRXsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ozxy=mv=columbia.edu=jl4312@srs-us1.protection.inumbo.net>)
 id 1g9vbp-0003sy-Vq
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 17:15:50 +0000
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
 by outprodmail01.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id w99HCfQc055273
 for <xen-devel@lists.xenproject.org>; Tue, 9 Oct 2018 13:15:47 -0400
Received: from hazelnut (localhost.localdomain [127.0.0.1])
 by hazelnut (Postfix) with ESMTP id BD54C6D
 for <xen-devel@lists.xenproject.org>; Tue,  9 Oct 2018 13:15:47 -0400 (EDT)
Received: from sendprodmail03.cc.columbia.edu (sendprodmail03.cc.columbia.edu
 [128.59.72.15]) by hazelnut (Postfix) with ESMTP id 9FF5F6D
 for <xen-devel@lists.xenproject.org>; Tue,  9 Oct 2018 13:15:47 -0400 (EDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 by sendprodmail03.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id w99HFk6W064228
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Tue, 9 Oct 2018 13:15:47 -0400
Received: by mail-ed1-f72.google.com with SMTP id l51-v6so1638609edc.14
 for <xen-devel@lists.xenproject.org>; Tue, 09 Oct 2018 10:15:47 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id z33-v6sm6995028edb.85.2018.10.09.10.15.44
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Oct 2018 10:15:44 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id i8-v6so2646923wmg.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Oct 2018 10:15:44 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: malcolm.crossley@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpJJ20gb2JzZXJ2aW5nIGEgaHVnZSBwZXJmb3JtYW5jZSBkcm9wIGZvciBtZW1jYWNoZWQg
d29ya2xvYWQgb24geDg2CndpdGggdGhlIGZvbGxvd2luZyBjb21taXQsIHdoaWNoIHdhcyBtZXJn
ZWQgdG8gTGludXgga2VybmVsIDQuNS4KQmVmb3JlIHRoaXMgcGF0Y2gsIG1lbWNhY2hlZCBvdmVy
aGVhZCBpcyBhYm91dCAxMTMlIChpLmUuIDEzJSBzbG93ZXIKdGhhbiBuYXRpdmUgTGludXgpIFsx
XSwgYnV0IHdpdGggdGhpcyBwYXRjaCBpdCBiZWNvbWVzIDE3NSUuIEkKb2JzZXJ2ZWQgZXZlbiBi
aWdnZXIgcGVyZm9ybWFuY2UgZHJvcCBvbiBvdGhlciBoYXJkd2FyZSBwbGF0Zm9ybXMuCgpjb21t
aXQgN2QwMTA1YjUzMzRiOTcyMmI3ZDMzYWNhZDYxMzA5NmRmY2YzMzMwZQpBdXRob3I6IE1hbGNv
bG0gQ3Jvc3NsZXkgPG1hbGNvbG0uY3Jvc3NsZXlAY2l0cml4LmNvbT4KRGF0ZTogICBUdWUgSmFu
IDI2IDE3OjEyOjQ0IDIwMTYgKzAwMDAKCiAgICB4ZW4tbmV0ZnJvbnQ6IHJlcXVlc3QgVHggcmVz
cG9uc2UgZXZlbnRzIG1vcmUgb2Z0ZW4KCkknbSBjb21wYXJpbmcgcGVyZm9ybWFuY2UgYmV0d2Vl
biBMaW51eCBrZXJuZWwgNC4wIGFuZCA0LjE1IGluIERvbVUsCmFuZCBJJ20gc2VlaW5nIHRoaXMg
YmVoYXZpb3IgYm90aCB3aXRoIFhlbiA0LjUuMCBhbmQgWGVuIDQuMTAuMS4gSSdtCnVzaW5nIDR2
Y3B1cyBmb3IgRG9tMCBhbmQgcHZodm0gRG9tVS4KCkkgd29uZGVyIGluIHdoYXQgc2NlbmFyaW8g
dGhpcyBwYXRjaCBoZWxwcyB0byBpbXByb3ZlIHBlcmZvcm1hbmNlIGFuZApkb2Vzbid0PyBJIGFs
c28gd29uZGVyIGlmIG90aGVycyBvYnNlcnZlZCBhIHNpbWlsYXIgYmVoYXZpb3I/CgpUaGFua3Ms
CkppbnRhY2sKClsxXSBodHRwOi8vd3d3LmNzLmNvbHVtYmlhLmVkdS9+Y2RhbGwvcHVicy9pc2Nh
MjAxNi1kYWxsLnBkZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
