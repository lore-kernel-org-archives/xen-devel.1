From: Meng Xu <xumengpanda@gmail.com>
Subject: Re: RTDS with extra time issue
Date: Fri, 9 Feb 2018 12:53:37 -0500
Message-ID: <CAENZ-+kdiGJe9UT8fP-w=T2GzTDm5AQr5zgdMLFUAsKsAFLQiQ@mail.gmail.com>
References: <762ccb02-b758-1636-fddc-f4e6a3ca19d0@epam.com>
 <CAENZ-+=O5Xb=sZ2mwvihryWWx6fOVU=0pcSe0j8JAMaK3sXjRQ@mail.gmail.com>
 <a3d0cbcf-2bee-391f-39de-d19906616fc6@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="001a113dee74a156080564cb3789"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ij1s=fd=gmail.com=xumengpanda@srs-us1.protection.inumbo.net>)
 id 1ekCsO-00019a-A5
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 17:54:20 +0000
Received: by mail-io0-x231.google.com with SMTP id m11so10512493iob.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Feb 2018 09:54:18 -0800 (PST)
In-Reply-To: <a3d0cbcf-2bee-391f-39de-d19906616fc6@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

--001a113dee74a156080564cb3789
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 9, 2018 at 11:04 AM, Andrii Anisov <andrii_anisov@epam.com> wrote:
>
> On 09.02.18 17:34, Meng Xu wrote:
>>
>> If you want to keep the same VCPU parameter, can you try to set task's
>> period = 100ms and exe time = 40ms?
>> By theory (I used CARTS to compute), a VCPU (10ms, 5ms) can schedule a
>> task (100ms, 40ms).
>> Note that the resource demand of two RT tasks with the same utilization is
>> different: the task with smaller period has larger demand.
>
> BTW, could you please share the model xml file to me?
>

Sure!
It's attached.

Meng

--001a113dee74a156080564cb3789
Content-Type: text/xml; charset="US-ASCII"; name="example-in.xml"
Content-Disposition: attachment; filename="example-in.xml"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jdg8d2dk0

PHN5c3RlbSBvc19zY2hlZHVsZXI9IkVERiIgcGVyaW9kPSIyIj4gDQoJPGNvbXBvbmVudCBuYW1l
PSJDMCIgc2NoZWR1bGVyPSJFREYiIHBlcmlvZD0iMTAiPiANCgkJIDx0YXNrIG5hbWU9IlQwIiBw
PSIxMDAiIGQ9IjEwMCIgZT0iNDAiID4gPC90YXNrPg0KCQkgDQoJPC9jb21wb25lbnQ+DQo8L3N5
c3RlbT4NCg==
--001a113dee74a156080564cb3789
Content-Type: text/xml; charset="US-ASCII"; name="example-out.xml"
Content-Disposition: attachment; filename="example-out.xml"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jdg8d2du1

PGNvbXBvbmVudCBuYW1lPSJPUyBTY2hlZHVsZXIiIGFsZ29yaXRobT0iUFJNIGludGVyZmFjZSI+
Cgk8cmVzb3VyY2U+CgkJPG1vZGVsIHBlcmlvZD0iMiIgYmFuZHdpZHRoPSIxIiBkZWFkbGluZT0i
MiI+IDwvbW9kZWw+Cgk8L3Jlc291cmNlPgoJPHByb2Nlc3NlZF90YXNrPgoJCTxtb2RlbCBwZXJp
b2Q9IjIiIGV4ZWN1dGlvbl90aW1lPSIyIiBkZWFkbGluZT0iMiI+IDwvbW9kZWw+Cgk8L3Byb2Nl
c3NlZF90YXNrPgoJPGNvbXBvbmVudCBuYW1lPSJDMCIgYWxnb3JpdGhtPSJQUk0gaW50ZXJmYWNl
Ij4KCQk8cmVzb3VyY2U+CgkJCTxtb2RlbCBwZXJpb2Q9IjEwIiBiYW5kd2lkdGg9IjAuNSIgZGVh
ZGxpbmU9IjEwIj4gPC9tb2RlbD4KCQk8L3Jlc291cmNlPgoJCTxwcm9jZXNzZWRfdGFzaz4KCQkJ
PG1vZGVsIHBlcmlvZD0iMTAiIGV4ZWN1dGlvbl90aW1lPSI1IiBkZWFkbGluZT0iMTAiPiA8L21v
ZGVsPgoJCTwvcHJvY2Vzc2VkX3Rhc2s+Cgk8L2NvbXBvbmVudD4KPC9jb21wb25lbnQ+Cg==
--001a113dee74a156080564cb3789
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--001a113dee74a156080564cb3789--
