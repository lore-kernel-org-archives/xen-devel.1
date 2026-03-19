Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2931109023F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 16:15:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257358.1551764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3G1m-0006VL-PX; Thu, 19 Mar 2026 16:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257358.1551764; Thu, 19 Mar 2026 16:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3G1m-0006VE-M3; Thu, 19 Mar 2026 16:15:18 +0000
Received: by outflank-mailman (input) for mailman id 1257358;
 Thu, 19 Mar 2026 16:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o83W=BT=bounce.vates.tech=bounce-md_30504962.69bc210d.v1-d4c2db22c0c84784b50c1b5ae9d0f180@srs-se1.protection.inumbo.net>)
 id 1w3G1k-0006V8-KU
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:15:16 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd48ccab-23ae-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:15:10 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fc9lK2szCzPm1WpB
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 16:15:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d4c2db22c0c84784b50c1b5ae9d0f180; Thu, 19 Mar 2026 16:15:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cd48ccab-23ae-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773936909; x=1774206909;
	bh=nErjO3JFNjQF1BONX7ptqPz6dG43+kOcWYlI3A9XHLY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=caFSg8a93sie5xznOKSoH6LaqGuANCMbu294Xg4QOkSC0eiLeCSmseo3rbAqt4KB/
	 jhgG/bZlFa2GD+9nOwF7ioWA6q7cz4Tp4/w0uBxU6M/yRucpYPB4fezH2/vvOBE2Zq
	 +FV4PT2cQyNytsh99+9ODMWghFNQmojeIiYLGK0fx+2+jcTP0dCop9n+bBGRi4IFav
	 jnf5NbpjinnSvqJYS9dXVRCt1esWmL8mPKy3rr2329DQQgOZ297hDECA/HG0nqa+pr
	 /nH2IZRieadDrnJMiSYh5N3dXbL7iUaO9izs4ArswqAD4W8ZwPVpi/nKIuMmmA2+fH
	 diIzdzji+HyDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773936909; x=1774197409; i=anthony.perard@vates.tech;
	bh=nErjO3JFNjQF1BONX7ptqPz6dG43+kOcWYlI3A9XHLY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=azBQYrFYDdyxywMgFUvJdjgk0WVWqRfzp5p+kt740xB2bGGW6hnQ2Xny2caNwVXod
	 joYJDKF3NcPUM6vz7W3V78vqiPdnI5O8xP8QXeHgdT55HoRvKBhMOql8XRQWCNpVNd
	 YgOuft7P7Tt+ggiCa30JirsmwAMj/7QuNUm50e6JsLtp1YIxJtIKv8hcJGoteTT2gR
	 Frh08s9NOv0LJatQxkeMMgIf4p8wesZ6H/Jr3XuK2N8C6w2hPexR5kBwBmdkgexsVI
	 XGCW1Vi9eZJUvpycy+15XuIAq7+9trRrnnc1oT4LlwrhO4CY48+VKV7TFF++zK/Jey
	 DINjc2vgL+bwg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2004/11]=20tools/xenstored:=20add=20GLOBAL=5FQUOTA=5FDATA=20record=20for=20live=20update?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773936908843
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Julien Grall" <julien@xen.org>
Message-Id: <abwhDCOT487Z4D8A@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14> <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com> <52da8abd-a9d0-4a7d-8213-93a94b489fc6@suse.com>
In-Reply-To: <52da8abd-a9d0-4a7d-8213-93a94b489fc6@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d4c2db22c0c84784b50c1b5ae9d0f180?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 16:15:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 01:16:30PM +0100, Juergen Gross wrote:
> On 16.03.26 09:15, J=C3=BCrgen Gro=C3=9F wrote:
> > On 13.03.26 18:08, Anthony PERARD wrote:
> > > On Thu, Mar 05, 2026 at 02:52:01PM +0100, Juergen Gross wrote:
> > > > +static void build_quota_data(struct quota *quota, uint32_t *val, c=
har *name)
> > > 
> > > I guess we will need a leap of faith to trust that `val` is big enoug=
h,
> > > after finding out that it's actually an output of multiple values, an=
d
> > > not an input of a single value.
> > 
> > That's what get_quota_size() is calculating.
> > 
> > > 
> > > And `name` seems to also be an output, and this is actually impossibl=
e
> > > to guess from the prototype.
> > 
> > True. What about names?
> 
> I have chosen names_buf instead, making it more clear that this is an
> output parameter for multiple names.

Sounds good.

> > > > +const char *dump_state_glb_quota(FILE *fp)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct xs_state_record_header *head;
> > > > +=C2=A0=C2=A0=C2=A0 struct xs_state_glb_quota *glb;
> > > > +=C2=A0=C2=A0=C2=A0 void *record;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int n_quota;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int len =3D sizeof(*glb);
> > > > +=C2=A0=C2=A0=C2=A0 size_t ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 n_quota =3D get_quota_size(quotas, &len);
> > > 
> > > So, get_quota_size is actually an "add" the size to this variable, an=
d
> > > not "store" the size in this variable. That's not confusing at all.
> > 
> > Would it be better if len is renamed to names_len (both here and the
> > parameter of get_quota_size())?
> 
> In the end I have chosen to add a comment above get_quota_size() and
> rename "len" to "rec_len" in dump_state_glb_quota().

It would still be counter-intuitive if get_quota_size() returns different
values depending on the initial value of the second parameter. A comment
won't help. So I would still propose to add "sizeof(*glb)" to `len` or
`rec_len` after calling get_quota_size.

Cheers,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



